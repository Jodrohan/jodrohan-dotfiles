function backup-os
    sudo cp -r /etc/keyd/* ~/.config/keyd-backup/
    sudo chown -R $USER:$USER ~/.config/keyd-backup
    pacman -Qqe > ~/.config/pkglist.txt
    dotfiles add -u
    dotfiles add ~/.config/keyd-backup ~/.config/hypr ~/.config/fish ~/.config/kitty
    dotfiles commit -m "Sync system tweaks: "(date "+%Y-%m-%d %H:%M")
    dotfiles push
end
