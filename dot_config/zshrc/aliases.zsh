# ============================================
# Shell
# ============================================
alias reload="exec zsh"

# ============================================
# Navigation
# ============================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias projects="cd ~/projects/"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# ============================================
# File listing (eza)
# ============================================
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"
alias tree="eza --tree --icons"

# ============================================
# File viewing (bat)
# ============================================
alias bat="bat --style=auto"
alias batp="bat --style=plain --paging=never"

# ============================================
# Search
# ============================================
alias fd="fd --hidden --exclude .git"
alias rg="rg --smart-case"

# ============================================
# System
# ============================================
alias top="btop"
alias df="duf"
alias du="dust"
alias ps="procs"

# ============================================
# Git
# ============================================
alias lg="lazygit"

# ============================================
# Docker
# ============================================
alias lzd="lazydocker"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dex="docker exec -it"
alias dc="docker compose"
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcl="docker compose logs -f"

# ============================================
# Editors
# ============================================
alias vim="nvim"
alias vi="nvim"
alias v="nvim"

# ============================================
# Utilities
# ============================================
alias c="clear"
alias h="history"
alias path="echo $PATH | tr ':' '\n'"
alias ports="lsof -iTCP -sTCP:LISTEN -n -P"
alias myip="curl -s ifconfig.me"
alias localip="ipconfig getifaddr en0"
