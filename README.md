<div align="center">

# 🦢 Jodrohan's CachyOS × Hyprland Dotfiles
**`<Solo Code Is Source The/>`**

![OS](https://img.shields.io/badge/OS-CachyOS%20x86__64-00D8FF?style=for-the-badge&logo=archlinux&logoColor=white)
![WM](https://img.shields.io/badge/WM-Hyprland%20(Lua)-58E1FF?style=for-the-badge&logo=wayland&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-Fish%204.9-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Terminal](https://img.shields.io/badge/Terminal-Kitty-FF6600?style=for-the-badge)

*A minimal, dark-focused Wayland environment engineered for speed, keyboard-driven workflows, and zero-bloat TTY boot.*

![Desktop Preview](assets/preview.png)

</div>

---

## ⚡ Key Highlights

* **Modular Lua Hyprland Config:** Structured configuration (`general.lua`, `keybinds.lua`, `rules.lua`, `variables.lua`) with custom AI & Fuzzel helper scripts.
* **75% Keyboard Numpad Layer (`keyd`):** Hardware-level daemon remapping the right-hand navigation cluster (`PrtSc` to `Up Arrow`) into a full functional Numpad layer.
* **Zero-GUI Silent TTY Auto-Login:** Bypasses bloated display managers (`SDDM`/`GDM`). Logging into `tty1` silently launches `start-hyprland` and only outputs to the screen if a crash/error occurs.
* **Fish Shell & XDG Workflow:** Pre-configured abbreviations, instant `xdg-open` shortcuts, and a one-word `backup-os` live Git sync function.

---

## 🛠️ System Stack

| Component | Details |
| :--- | :--- |
| **OS / Kernel** | CachyOS x86_64 (`linux-cachyos`) |
| **Window Manager** | Hyprland (Wayland) + `hyprlock` |
| **Terminal & Shell** | `kitty` + `fish` |
| **Key Remapper** | `keyd` (`/etc/keyd/default.conf`) |
| **System Fetch** | `fastfetch` |

---

## 🚀 1-Command Installation

Clone and deploy this entire environment on a fresh Arch / CachyOS installation:

```bash
curl -fsSL [https://raw.githubusercontent.com/Jodrohan/jodrohan-dotfiles/main/install.sh](https://raw.githubusercontent.com/Jodrohan/jodrohan-dotfiles/main/install.sh) | bash
```

### Manual Clone (Bare Repo Method)
If you only want to pull the configuration files without installing all packages:

```bash
git clone --bare [https://github.com/Jodrohan/jodrohan-dotfiles.git](https://github.com/Jodrohan/jodrohan-dotfiles.git) $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no
```

---

## 📂 Repository Structure

```text
.
├── .config/
│   ├── fastfetch/       # Custom ASCII & hardware fetch layout
│   ├── fish/            # Fish shell abbreviations, TTY auto-Hypr, & backup-os
│   ├── hypr/            # Modular Lua Hyprland configs, scripts, & hyprlock
│   ├── keyd-backup/     # 75% keyboard right-side Numpad daemon rules
│   ├── kitty/           # GPU-accelerated terminal theme & Python search scripts
│   └── pkglist.txt      # Full explicit CachyOS package manifest
├── assets/
│   └── preview.png      # Fastfetch & system showcase screenshot
├── .bash_profile        # Fallback TTY auto-start wrapper
├── .bashrc              # Bash configuration
└── install.sh           # Automated bootstrap & deployment script
```

---

## 🔄 Daily Maintenance

To sync new tweaks, packages, and `keyd` rules back to GitHub, run:

```fish
backup-os
```
