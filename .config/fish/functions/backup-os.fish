function backup-os --description "Sync dotfiles, workspace clone, package lists, and Btrfs snapshots"
    set -l ws_repo "$HOME/workspace/github/jodrohan-dotfiles"
    alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    set -l golden_id (string trim (cat ~/system-backup/golden_baseline_id 2>/dev/null; or echo 522))

    echo ":: [1/5] Syncing workspace clone ($ws_repo)..."
    if test -d "$ws_repo/.git"
        git -C "$ws_repo" add -A
        if not git -C "$ws_repo" diff --cached --quiet
            git -C "$ws_repo" commit -m "Sync docs/assets from workspace: "(date "+%Y-%m-%d %H:%M")
            git -C "$ws_repo" push origin main
        end
        dotfiles pull --rebase origin main
    end

    echo ":: [2/5] Exporting package lists and keyd config..."
    mkdir -p ~/system-backup
    pacman -Qqen > ~/system-backup/pkglist.txt
    pacman -Qqem > ~/system-backup/pkglist-aur.txt
    if test -f /etc/keyd/default.conf
        cp -f /etc/keyd/default.conf ~/system-backup/default.conf
    end

    echo ":: [3/5] Committing and pushing live dotfiles..."
    dotfiles add -u
    dotfiles add ~/system-backup/
    if not dotfiles diff --cached --quiet
        dotfiles commit -m "Sync system tweaks: "(date "+%Y-%m-%d %H:%M")
        dotfiles push origin main
    else
        echo "   -> No new live dotfile changes to commit."
        dotfiles push origin main
    end

    echo ":: [4/5] Updating workspace clone to match origin/main..."
    if test -d "$ws_repo/.git"
        git -C "$ws_repo" pull --rebase origin main
    end

    echo ":: [5/5] Rotating rolling Btrfs snapshots (keeping Golden Baseline #$golden_id + latest 1)..."
    sudo snapper create --description "Rolling Backup: "(date "+%Y-%m-%d %H:%M")
    for snap in (sudo snapper list | awk 'NR>2 {print $1}' | string trim | grep -vE "^(0|$golden_id)\$" | head -n -1)
sudo snapper delete $snap
end
sudo limine-snapper-sync
sudo snapper list
end
