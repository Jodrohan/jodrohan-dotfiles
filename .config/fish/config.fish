if status is-interactive
    set fish_greeting

    # FZF & Directory Navigation
    fzf --fish | source
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --exclude .git --exclude .dotfiles --exclude .wine --exclude .cache --exclude .local/share/Steam'
    set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
    set -gx FZF_ALT_C_COMMAND 'fd --type d --strip-cwd-prefix --hidden --exclude .git --exclude .dotfiles --exclude .wine --exclude .cache --exclude .local/share/Steam'

    zoxide init fish | source

    # Yazi wrapper (change directory on exit)
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
    end

    # Starship Prompt
    function starship_transient_prompt_func
        starship module character
    end
    if test "$TERM" != "linux"
        starship init fish | source
        enable_transience
    end

    # Quickshell generated terminal color sequences
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    if test "$TERM" != "linux"
        alias ls 'eza --icons=auto'
    end
    if test "$TERM" = "xterm-kitty"
        alias ssh 'kitten ssh'
    end

    # Cloudflare Warp
    alias warp-on="sudo systemctl start warp-svc.service; and sleep 1; and warp-cli connect"
    alias warp-off="warp-cli disconnect; and sudo systemctl stop warp-svc.service"
end
