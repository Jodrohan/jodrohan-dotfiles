function backup-os
    sudo cp -r /etc/keyd/* ~/.config/keyd-backup/
    sudo chown -R $USER:$USER ~/.config/keyd-backup
    sudo cp /etc/snapper/configs/root ~/.config/snapper-backup/root
    sudo chown -R $USER:$USER ~/.config/snapper-backup
    sudo snapper -c root create --cleanup-algorithm number --description "backup-os rolling checkpoint"
    sudo snapper -c root cleanup number
    pacman -Qqen > ~/.config/pkglist.txt
    pacman -Qqem > ~/.config/pkglist-aur.txt
    dotfiles add -u
    dotfiles add ~/README.md ~/install.sh ~/assets ~/.config/keyd-backup ~/.config/snapper-backup ~/.config/hypr ~/.config/fish ~/.config/kitty ~/.config/fastfetch ~/.config/pkglist.txt ~/.config/pkglist-aur.txt
    dotfiles commit -m "Sync system state: "(date "+%Y-%m-%d %H:%M")
    dotfiles push
end
