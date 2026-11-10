function golden-os --description "Manage permanent Golden Baseline snapshot (update | status | restore)"
    set -l baseline_file "$HOME/system-backup/golden_baseline_id"
    mkdir -p "$HOME/system-backup"

    if not test -f "$baseline_file"
        echo "522" > "$baseline_file"
    end
    set -l current_golden (string trim (cat "$baseline_file"))
    set -l action $argv[1]
    if test -z "$action"
        set action "status"
    end

    switch $action
        case "update"
            echo ":: [1/4] Creating new permanent Golden Baseline snapshot..."
            set -l new_id (sudo snapper create --print-number --userdata "important=yes" --description "Golden Baseline - Maverick Clean OS")
            if test -z "$new_id"
                echo "Error: Failed to create snapshot."
                return 1
            end

            echo ":: [2/4] Cleaning old snapshots to keep /boot permanently under 60%..."
            for snap in (sudo snapper list | awk 'NR>2 {print $1}' | string trim | grep -vE "^(0|$new_id)\$")
sudo snapper delete $snap 2>/dev/null
end

echo "$new_id" > "$baseline_file"
echo ":: [3/4] Locking Snapshot #$new_id into Limine boot menu (/boot)..."
sudo limine-snapper-sync

echo ":: [4/4] Syncing new Golden Baseline ID (#$new_id) to GitHub dotfiles..."
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles add "$baseline_file" ~/.config/fish/functions/golden-os.fish ~/.config/fish/functions/backup-os.fish 2>/dev/null
if not dotfiles diff --cached --quiet
dotfiles commit -m "Lock Golden Baseline at Snapshot #$new_id"
dotfiles push origin main
end

echo ""
echo "SUCCESS: Golden Baseline is now permanently locked at Snapshot #$new_id!"
sudo limine-snapper-info
sudo limine-snapper-list

case "restore"
echo ":: Launching Limine Snapshot Restore (Golden Baseline is #$current_golden)..."
sudo limine-snapper-restore

case "status" "*"
echo "===================================================="
echo "  GOLDEN BASELINE STATUS (Locked ID: #$current_golden)"
echo "===================================================="
sudo snapper list
echo ""
sudo limine-snapper-info
echo ""
sudo limine-snapper-list
echo ""
echo "Commands:"
echo "  golden-os status   -> Check boot space & verify Golden Baseline is in Limine"
echo "  golden-os update   -> Replace Golden Baseline with current system state"
echo "  golden-os restore  -> Roll back to Golden Baseline (#$current_golden)"
end
end
