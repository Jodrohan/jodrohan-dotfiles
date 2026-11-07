# maverick-dotfiles

`<Solo Is The Source Code/>`

Minimal CachyOS (`x86_64`) Wayland workstation configuration.

## Stack

* **OS:** CachyOS (`linux-cachyos`)
* **WM:** Hyprland (Lua) + Quickshell
* **Terminal:** Kitty (`0.85` opacity)
* **Shell:** Fish + Yazi (`y`)
* **Input:** `keyd` (`evdev` daemon)
* **Recovery:** Btrfs + Snapper + Limine (`1` baseline + `3` rolling)

## Keybinds

* `Super + Q` / `Return` — Kitty
* `Super + E` — Yazi
* `Super + C` — Close window
* `Super + /` — Keybind overlay
* `backup-os` — Sync dotfiles, package lists, and Btrfs snapshots

## Bootstrap

```sh
git clone --bare [https://github.com/Jodrohan/jodrohan-dotfiles.git](https://github.com/Jodrohan/jodrohan-dotfiles.git) ~/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout -f && chmod +x ~/install.sh && ~/install.sh
```
