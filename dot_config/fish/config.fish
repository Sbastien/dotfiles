if status is-login
    # .zprofile's job in zsh. A nested `fish` inherits PATH already, so the
    # subprocess only earns its cost in a login shell.
    /opt/homebrew/bin/brew shellenv fish | source
end

fish_add_path --global --move "$HOME/.local/bin"

set -gx EDITOR nvim
# Without --color, fzf picks Dark256 on a 256-colour TERM and its greys come
# from the xterm cube, which no Ghostty theme touches.
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --color=16"

if status is-interactive
    set -g fish_greeting

    # After fish_add_path above, because the last activation owns the front of
    # PATH and mise has to sit ahead of ~/.local/bin the way .zshrc leaves it.
    # conf.d/mise-activate.fish stops Homebrew's copy running this a second time.
    mise activate fish | source
    starship init fish | source
    fzf --fish | source
    # After fzf, which also binds ctrl-r and would otherwise win. --disable-ai
    # drops a default binding of `?` to a remote model call; --disable-up-arrow
    # keeps the arrow on fish's own prefix search.
    atuin init fish --disable-up-arrow --disable-ai | source
    zoxide init fish | source
    command wt config shell init fish | source

    # Overrides fish's own forward-token/backward-token, which cross a whole
    # argument at a time. zsh stops on each path segment here, via WORDCHARS=''.
    bind ctrl-right forward-word
    bind ctrl-left backward-word

    # Implicit cd stops at two dots, so `..` needs no alias and `...` does.
    alias ... "cd ../.."
    alias .... "cd ../../.."
    alias projects "cd ~/projects"
    alias icloud 'cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
    alias reload "exec fish"

    # Replacing a tool's name only works when the replacement takes its flags.
    # Do not alias du, df, ps, top or tree: dust, duf, procs, btop and eza read
    # an unrecognised argument as a query rather than an error.
    # --icons=auto, never bare: its value is optional, so a trailing --icons
    # eats the path instead and `lt somedir` exits 2.
    alias ls "eza --icons=auto --group-directories-first"
    # eza's -a is ls's -A (dotfiles, no . or ..); -aa is ls's -a.
    alias ll "eza -lh --icons=auto --group-directories-first"
    alias l "eza -laah --icons=auto --group-directories-first"
    alias la "eza -lah --icons=auto --group-directories-first"
    alias lt "eza --tree --level=2 --icons=auto"

    alias batp "bat --style=plain --paging=never"
    alias fd "fd --hidden --exclude .git"
    alias rg "rg --smart-case"

    alias lg lazygit
    alias vim nvim
    alias vi nvim
    alias v nvim

    alias c clear
    alias h history
    alias path 'string join \n -- $PATH'
    alias ports "lsof -iTCP -sTCP:LISTEN -n -P"
    alias myip "curl -s ifconfig.me"
    alias localip "ipconfig getifaddr en0"

    # abbr rather than alias: the expansion is on the line before it runs, so
    # the shortcut never hides which command took the arguments.
    abbr -a dps "docker ps"
    abbr -a dpa "docker ps -a"
    abbr -a dex "docker exec -it"
    abbr -a dc "docker compose"
    abbr -a dcu "docker compose up -d"
    abbr -a dcd "docker compose down"
    abbr -a dcl "docker compose logs -f"
    abbr -a wsc "wt switch --create --execute=claude"
end
