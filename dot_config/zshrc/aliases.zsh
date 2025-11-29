# ============================================
# Shell & Config
# ============================================
alias reload="exec zsh"

# ============================================
# Navigation
# ============================================
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias projects="cd ~/projects/"

# ============================================
# Modern CLI Tools (macgyver installs)
# ============================================

# File listing (eza replaces ls)
alias ls="eza --icons --group-directories-first"
alias ll="eza -lah --icons --group-directories-first"
alias la="eza -a --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"
alias llt="eza -lah --tree --level=3 --icons"
alias tree="eza --tree --icons"

# File viewing (bat - don't override cat to avoid breaking scripts)
alias bat="bat --style=auto"
alias batt="bat --style=plain"
alias batp="bat --style=plain --paging=never"

# File finding (fd replaces find)
alias fd="fd --hidden --exclude .git"
alias fda="fd --hidden --no-ignore"  # show all, including ignored

# Content search (ripgrep)
alias rg="rg --smart-case"
alias rga="rg --hidden --no-ignore"  # search all files

# ============================================
# System Monitoring
# ============================================
alias top="btop"
alias htop="btop"
alias df="duf"
alias du="dust"
alias ps="procs"

# ============================================
# Git Aliases (shell-specific only)
# ============================================
# Git aliases are in ~/.gitconfig
# Only shell-specific git tools here
alias lg="lazygit"
alias g="git"

# ============================================
# Docker
# ============================================
alias lzd="lazydocker"
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dex="docker exec -it"
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcl="docker-compose logs -f"

# ============================================
# Development
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
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias week="date +%V"
alias timer="echo 'Timer started. Stop with Ctrl-D.' && date && time cat && date"

# ============================================
# JSON/YAML Processing
# ============================================
alias jqp="jq -C . | less -R"  # pretty print JSON with colors
alias yqp="yq -C . | less -R"  # pretty print YAML with colors
