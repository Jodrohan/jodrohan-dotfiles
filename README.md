<div align="center">

# 🦢 Maverick Dotfiles
### `<Solo Is The Source Code/>`

![OS](https://img.shields.io/badge/OS-CachyOS_x86__64-11111b?style=for-the-badge&logo=archlinux&logoColor=89b4fa&labelColor=181825)
![WM](https://img.shields.io/badge/WM-Hyprland_(Lua)-11111b?style=for-the-badge&logo=wayland&logoColor=f5c2e7&labelColor=181825)
![Shell](https://img.shields.io/badge/Shell-Fish_4.9-11111b?style=for-the-badge&logo=gnubash&logoColor=a6e3a1&labelColor=181825)
![Terminal](https://img.shields.io/badge/Terminal-Kitty-11111b?style=for-the-badge&logo=kitty&logoColor=fab387&labelColor=181825)
![Daemon](https://img.shields.io/badge/Input-keyd_evdev-11111b?style=for-the-badge&logo=linux&logoColor=f9e2af&labelColor=181825)

*A low-latency, keyboard-centric Wayland workstation engineered for CachyOS—featuring modular Lua window management, kernel-level `keyd` input layers, and a silent TTY1 boot pipeline.*

<br>

<img src="assets/preview.png" alt="Maverick Desktop Preview" width="100%">

</div>

---

## ⌨️ Hardware Input Architecture (`keyd`)

Standard 75% keyboards sacrifice the dedicated Numpad for desk space. **Maverick** solves this at the Linux kernel `evdev`/`uinput` level using `keyd` (`/etc/keyd/default.conf`), transforming the right-hand navigation column and cluster into a zero-latency hardware Numpad layer that works across TTY and Wayland alike:

```text
┌─────────────────────────────────────────────────────────────────────────┐
│  75% KEYBOARD — RIGHT-HAND NAVIGATION CLUSTER REMAPPED VIA KEYD         │
├──────────────────────────────────┬──────────────────────────────────────┤
│        PHYSICAL KEYCAPS          │         REMAPPED NUMPAD LAYER        │
│                                  │                                      │
│   [ INS ]  [ HOME ]  [ PGUP ]    │      [ KP_7 ]  [ KP_8 ]  [ KP_9 ]    │
│   [ DEL ]  [ END  ]  [ PGDN ]    │      [ KP_4 ]  [ KP_5 ]  [ KP_6 ]    │
│            [  UP  ]              │      [ KP_1 ]  [ KP_2 ]  [ KP_3 ]    │
│   [ LEFT ] [ DOWN ]  [ RGHT ]    │                [ KP_0 ]  [ KP_. ]    │
└──────────────────────────────────┴──────────────────────────────────────┘
```

---

## ⚡ Silent TTY1 Boot Pipeline

No bloated graphical display managers (`SDDM`, `GDM`, or `LightDM`). The system boots straight into raw `tty1` and executes a silent, fault-tolerant handoff to Wayland:

```text
[ Systemd tty1 ] ──► [ Fish Login ] ──► [ exec start-hyprland >/dev/null 2>&1 ]
                                                │
                                                ├──► [ SUCCESS ] ──► Clean Wayland Session
                                                └──► [ FAILURE ] ──► Dump Crash Log to ~/.cache/hyprland.log
```

---

## 🧩 Core Engineering Highlights

* **Modular Lua Hyprland Engine:** Cleanly decoupled configuration split across `general.lua`, `keybinds.lua`, `rules.lua`, and `variables.lua`, paired with custom Ollama AI buffer query scripts and Fuzzel launchers.
* **Fish Shell & XDG Automation:** Instant `xdg-open` aliases, directory abbreviations, and a single-command `backup-os` Git synchronization pipeline.
* **Declarative State Sync:** Uses a zero-symlink Git bare repository (`~/.dotfiles`) paired with an automated `pacman -Qqe` package manifest and `/etc/keyd` privilege bridge.

---

## 🛠️ System Specifications

| Subsystem | Implementation | Config Path |
| :--- | :--- | :--- |
| **OS / Kernel** | CachyOS x86_64 (`linux-cachyos`) | `amd-pstate-epp` |
| **Compositor** | Hyprland `0.56.2` (Wayland) + `hyprlock` | `~/.config/hypr/` |
| **Terminal & Shell** | `kitty` + `fish 4.9.3` | `~/.config/kitty/` & `~/.config/fish/` |
| **Input Daemon** | `keyd` (`systemd` service) | `/etc/keyd/default.conf` |
| **System Fetch** | `fastfetch` | `~/.config/fastfetch/` |

---

## 🚀 Automated Deployment

Deploy the complete Maverick environment—including all explicit CachyOS packages, `keyd` kernel remaps, and silent TTY boot rules—on a fresh Arch/CachyOS machine with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/Jodrohan/jodrohan-dotfiles/main/install.sh | bash
```

<details>
<summary><b>🔧 Manual Bare-Repository Checkout (Configs Only)</b></summary>

<br>

If you only want to pull the configuration files without running the full system installer:

```bash
git clone --bare https://github.com/Jodrohan/jodrohan-dotfiles.git $HOME/.dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no
```

</details>

---

## 📂 Repository Topology

```text
maverick-dotfiles/
├── .config/
│   ├── fastfetch/                # Custom ASCII & hardware telemetry layout
│   ├── fish/
│   │   ├── conf.d/               # 99-user-custom.fish (Silent TTY launcher)
│   │   ├── functions/            # backup-os.fish (Automated Git sync engine)
│   │   └── auto-Hypr.fish        # Crash log redirection handler
│   ├── hypr/
│   │   ├── hyprland/             # Modular Lua configs (general, keybinds, rules, vars)
│   │   │   └── scripts/          # Ollama AI queries, snip_to_search, & fuzzel helpers
│   │   └── hyprlock/             # Lockscreen theme & battery/capslock status scripts
│   ├── keyd-backup/              # System /etc/keyd hardware remap mirror
│   ├── kitty/                    # GPU terminal config & Python scroll/search extensions
│   └── pkglist.txt               # Explicit CachyOS package manifest (1,764 packages)
├── assets/
│   └── preview.png               # System showcase screenshot
├── .bash_profile                 # Fallback TTY auto-start wrapper
├── .bashrc                       # Bash environment fallback
└── install.sh                    # Unattended system bootstrap script
```

---

## 🔄 Live Synchronization

To snapshot `/etc/keyd`, export the latest `pacman` package manifest, stage modified configurations, and push to `origin/main`, run from anywhere in Fish:

```fish
backup-os
```
