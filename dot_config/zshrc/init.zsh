# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git fzf zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
source $ZSH/oh-my-zsh.sh

# Load aliases & functions (after Oh My Zsh to override its aliases)
[ -f "$HOME/.config/zshrc/aliases.zsh" ] && source "$HOME/.config/zshrc/aliases.zsh"
[ -f "$HOME/.config/zshrc/functions.zsh" ] && source "$HOME/.config/zshrc/functions.zsh"

# Starship prompt
eval "$(starship init zsh)"

# Zoxide (smarter cd) - if installed via macgyver
if command -v zoxide >/dev/null; then
  eval "$(zoxide init zsh)"
fi
