#!/usr/bin/env bash
set -e
git clone --bare https://github.com/Jodrohan/jodrohan-dotfiles.git $HOME/.dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout -f
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no
sudo pacman -S --needed - < ~/.config/pkglist.txt
sudo mkdir -p /etc/keyd && sudo cp -r ~/.config/keyd-backup/* /etc/keyd/
sudo systemctl enable --now keyd
echo "System restore complete!"
