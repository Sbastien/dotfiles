alias reload="exec zsh"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias projects="cd ~/projects/"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

alias ls="eza --icons --group-directories-first"
# eza's -a is ls's -A (dotfiles, no . or ..); -aa is ls's -a.
alias ll="eza -lh --icons --group-directories-first"
alias l="eza -laah --icons --group-directories-first"
alias la="eza -lah --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"

alias batp="bat --style=plain --paging=never"

alias fd="fd --hidden --exclude .git"
alias rg="rg --smart-case"

alias lg="lazygit"
alias wsc='wt switch --create --execute=claude'

alias lzd="lazydocker"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dex="docker exec -it"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias chrome-debug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222 &'

alias c="clear"
# Bare `history` lists only the last 16 events, so `h | grep` would miss the
# other 50000.
alias h="history 1"
alias path='echo $PATH | tr ":" "\n"'
alias ports="lsof -iTCP -sTCP:LISTEN -n -P"
alias myip="curl -s ifconfig.me"
alias localip="ipconfig getifaddr en0"
