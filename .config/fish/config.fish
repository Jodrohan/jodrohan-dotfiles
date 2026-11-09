# Commands to run in interactive sessions can go here
if status is-interactive
    # No greeting
    set fish_greeting

    # Enable fzf Ctrl+T, Ctrl+R, and Alt+C keybindings
    fzf --fish | source

    # Use fd for faster file and directory searching (respects .gitignore)
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --exclude .git --exclude .dotfiles --exclude .dotfiles --exclude .wine --exclude .cache --exclude .local/share/Steam'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --exclude .git --exclude .dotfiles --exclude .dotfiles --exclude .wine --exclude .cache --exclude .local/share/Steam'

    # Enable zoxide for fast directory jumping (z and zi)
    zoxide init fish | source

    # Yazi wrapper function (type 'y' to launch and change directory on exit)
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
    end

    # Use starship
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
    end

    # Colors
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    # kitty doesn't clear properly so we need to do this weird printing
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias pamcan pacman
    alias q 'qs -c ii'
    if test "$TERM" != "linux"
        alias ls 'eza --icons=auto'
    end
    if test "$TERM" = "xterm-kitty"
        alias ssh 'kitten ssh'
    end

    # Cloudflare Warp aliases
    alias warp-on="sudo systemctl start warp-svc.service; and sleep 1; and warp-cli connect"
    alias warp-off="warp-cli disconnect; and sudo systemctl stop warp-svc.service"
end
