# ==========================================
# SUPERCHARGED FISH ABBREVIATIONS
# ==========================================

# --- 1. File & Directory Navigation ---
abbr -a .. "cd .."
abbr -a ... "cd ../.."
abbr -a .... "cd ../../.."
abbr -a l "ls -lh"
abbr -a ll "ls -la"
abbr -a la "ls -A"
abbr -a md "mkdir -p"
abbr -a rd "rmdir"
abbr -a p "pwd"

# --- 2. File Operations (Safe defaults) ---
abbr -a cp "cp -i"
abbr -a mv "mv -i"
abbr -a rm "rm -i"
abbr -a rmf "rm -rf"
abbr -a cx "chmod +x"
abbr -a chown "sudo chown"

# --- 3. Arch Linux & Pacman ---
abbr -a upd "sudo pacman -Syu"
abbr -a in "sudo pacman -S"
abbr -a rmv "sudo pacman -Rns"
abbr -a search "pacman -Ss"
abbr -a info "pacman -Si"
abbr -a localinfo "pacman -Qi"
abbr -a listorphans "pacman -Qtdq"
abbr -a rmorphans "sudo pacman -Rns (pacman -Qtdq)"
abbr -a clrcache "sudo pacman -Scc"
abbr -a unlock "sudo rm /var/lib/pacman/db.lck"

# --- 4. AUR (Using paru or yay) ---
abbr -a aupd "paru -Syu"  # Change 'paru' to 'yay' if you use yay instead
abbr -a ain "paru -S"
abbr -a armv "paru -Rns"

# --- 5. Systemd & Services ---
abbr -a sys "sudo systemctl"
abbr -a sysstart "sudo systemctl start"
abbr -a sysstop "sudo systemctl stop"
abbr -a sysres "sudo systemctl restart"
abbr -a sysstat "systemctl status"
abbr -a sysen "sudo systemctl enable --now"
abbr -a sysdis "sudo systemctl disable --now"
abbr -a jour "sudo journalctl -xe"
abbr -a jourf "sudo journalctl -f"

# --- 6. Git Operations ---
abbr -a g "git"
abbr -a gs "git status"
abbr -a ga "git add ."
abbr -a gaa "git add --all"
abbr -a gc "git commit -m"
abbr -a gca "git commit -am"
abbr -a gp "git push"
abbr -a gpl "git pull"
abbr -a gb "git branch"
abbr -a gco "git checkout"
abbr -a gcb "git checkout -b"
abbr -a gl "git log --oneline --graph"
abbr -a gd "git diff"
abbr -a gst "git stash"
abbr -a gstp "git stash pop"
abbr -a gcl "git clone"

# --- 7. Terminal & Session Control ---
abbr -a c "clear"
abbr -a x "exit"
abbr -a q "exit"
abbr -a reload "source ~/.config/fish/config.fish"
abbr -a h "history"

# --- 8. Hardware & Resource Monitoring ---
abbr -a df "df -h"
abbr -a free "free -h"
abbr -a top "btop" 
abbr -a ports "sudo netstat -tulanp"

# --- 9. Network & Utilities ---
abbr -a ping "ping -c 5"
abbr -a myip "curl ifconfig.me"
abbr -a wget "wget -c"
abbr -a grep "grep --color=auto"
abbr -a f "find . -name"
abbr -a tarx "tar -xvf"
abbr -a tarc "tar -cvf"

# --- 10. Quick Editors ---
abbr -a v "nvim"
abbr -a vi "nvim"
abbr -a n "nano"
abbr -a sv "sudo nvim"
