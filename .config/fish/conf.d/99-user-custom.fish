# --- 1. AUTO-START HYPRLAND ON TTY1 LOGIN ---
if status is-login
    if test -z "$WAYLAND_DISPLAY" -a "$XDG_VTNR" = "1"
        clear; exec start-hyprland >/dev/null 2>&1
    end
end

# --- 2. SILENT WEB APP LAUNCHER GENERATOR (Chromium App Mode) ---
function make_shortcut
    function $argv[1] --inherit-variable argv
        google-chrome-stable --app="$argv[2]" >/dev/null 2>&1 &
        disown
    end
end

# AI & Dev
make_shortcut gemini "https://gemini.google.com"
make_shortcut gpt "https://chatgpt.com"
make_shortcut fcc "https://www.freecodecamp.org"
make_shortcut gh "https://github.com"

# Streaming, Music & Wallpapers
make_shortcut yt "https://www.youtube.com"
make_shortcut jio "https://www.jiohotstar.com"
make_shortcut netflix "https://www.netflix.com"
make_shortcut spotify "https://open.spotify.com"
make_shortcut twitch "https://www.twitch.tv"
make_shortcut moe "https://moewalls.com"

# Shopping
make_shortcut fk "https://www.flipkart.com"
make_shortcut ajio "https://www.ajio.com"
make_shortcut myntra "https://www.myntra.com"
make_shortcut amazon "https://www.amazon.in"

# Socials
make_shortcut ig "https://www.instagram.com"
make_shortcut wa "https://web.whatsapp.com"
make_shortcut discord "https://discord.com/app"
make_shortcut x "https://x.com"
make_shortcut reddit "https://www.reddit.com"
make_shortcut linkedin "https://www.linkedin.com"

# --- 3. TERMINAL & POWER ABBREVIATIONS ---
if status is-interactive
    abbr -a -- shortcuts "sudo chattr -i ~/.config/fish/conf.d/99-user-custom.fish && nano ~/.config/fish/conf.d/99-user-custom.fish && sudo chattr +i ~/.config/fish/conf.d/99-user-custom.fish && source ~/.config/fish/conf.d/99-user-custom.fish"
    abbr -a -- .. "cd .."
    abbr -a -- ... "cd ../.."
    abbr -a -- .... "cd ../../.."
    abbr -a -- l "ls -lh"
    abbr -a -- ll "ls -la"
    abbr -a -- la "ls -A"
    abbr -a -- md "mkdir -p"
    abbr -a -- rd rmdir
    abbr -a -- p pwd
    abbr -a -- cp "cp -i"
    abbr -a -- mv "mv -i"
    abbr -a -- rm "rm -i"
    abbr -a -- rmf "rm -rf"
    abbr -a -- cx "chmod +x"
    abbr -a -- chown "sudo chown"
    abbr -a -- upd "sudo pacman -Syu"
    abbr -a -- in "sudo pacman -S"
    abbr -a -- rmv "sudo pacman -Rns"
    abbr -a -- search "pacman -Ss"
    abbr -a -- info "pacman -Si"
    abbr -a -- localinfo "pacman -Qi"
    abbr -a -- listorphans "pacman -Qtdq"
    abbr -a -- rmorphans "sudo pacman -Rns (pacman -Qtdq)"
    abbr -a -- clrcache "sudo pacman -Scc"
    abbr -a -- unlock "sudo rm /var/lib/pacman/db.lck"
    abbr -a -- aupd "paru -Syu"
    abbr -a -- ain "paru -S"
    abbr -a -- armv "paru -Rns"
    abbr -a -- sys "sudo systemctl"
    abbr -a -- sysstart "sudo systemctl start"
    abbr -a -- sysstop "sudo systemctl stop"
    abbr -a -- sysres "sudo systemctl restart"
    abbr -a -- sysstat "systemctl status"
    abbr -a -- sysen "sudo systemctl enable --now"
    abbr -a -- sysdis "sudo systemctl disable --now"
    abbr -a -- jour "sudo journalctl -xe"
    abbr -a -- jourf "sudo journalctl -f"
    abbr -a -- g git
    abbr -a -- gs "git status"
    abbr -a -- ga "git add ."
    abbr -a -- gaa "git add --all"
    abbr -a -- gc "git commit -m"
    abbr -a -- gca "git commit -am"
    abbr -a -- gp "git push"
    abbr -a -- gpl "git pull"
    abbr -a -- gb "git branch"
    abbr -a -- gco "git checkout"
    abbr -a -- gcb "git checkout -b"
    abbr -a -- gl "git log --oneline --graph"
    abbr -a -- gd "git diff"
    abbr -a -- gst "git stash"
    abbr -a -- gstp "git stash pop"
    abbr -a -- gcl "git clone"
    abbr -a -- c clear
    abbr -a -- x exit
    abbr -a -- q exit
    abbr -a -- reload "source ~/.config/fish/config.fish"
    abbr -a -- h history
    abbr -a -- df "df -h"
    abbr -a -- free "free -h"
    abbr -a -- top btop
    abbr -a -- ports "sudo netstat -tulanp"
    abbr -a -- ping "ping -c 5"
    abbr -a -- myip "curl ifconfig.me"
    abbr -a -- wget "wget -c"
    abbr -a -- grep "grep --color=auto"
    abbr -a -- tarx "tar -xvf"
    abbr -a -- tarc "tar -cvf"
    abbr -a -- v nvim
    abbr -a -- vi nvim
    abbr -a -- n nano
    abbr -a -- sv "sudo nvim"
    abbr -a -- sd "shutdown now"
    abbr -a -- rb reboot
    abbr -a -- sus "systemctl suspend"
    abbr -a -- bios "systemctl reboot --firmware-setup"
    abbr -a -- ft fastfetch
    abbr -a -- f fastfetch
end
