function backup-os
    sudo cp -r /etc/keyd/* ~/.config/keyd-backup/
    sudo chown -R $USER:$USER ~/.config/keyd-backup
    sudo cp /etc/snapper/configs/root ~/.config/snapper-backup/root
    sudo chown -R $USER:$USER ~/.config/snapper-backup
    sudo snapper -c root create --cleanup-algorithm number --description "backup-os rolling checkpoint"
    sudo snapper -c root cleanup number
    pacman -Qqe > ~/.config/pkglist.txt
    dotfiles add -u
    dotfiles add ~/.config/keyd-backup ~/.config/snapper-backup ~/.config/hypr ~/.config/fish ~/.config/kitty ~/.config/pkglist.txt
    dotfiles commit -m "Sync system tweaks: "(date "+%Y-%m-%d %H:%M")
    dotfiles push
end
