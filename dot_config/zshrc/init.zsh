# load aliases & functions
[ -f "$HOME/.config/zshrc/aliases.zsh" ] && source "$HOME/.config/zshrc/aliases.zsh"
[ -f "$HOME/.config/zshrc/functions.zsh" ] && source "$HOME/.config/zshrc/functions.zsh"

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git fzf zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
source $ZSH/oh-my-zsh.sh

# Starship prompt configuration
eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
