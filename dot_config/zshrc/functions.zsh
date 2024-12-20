# System and tools update function
function update() {
    echo "🔄 Starting system and tools update..."

    # 1. macOS updates
    echo "🖥  Checking macOS updates..."
    sudo softwareupdate -i -a --verbose || echo "❌ macOS updates failed."

    # 2. Homebrew updates
    if command -v brew >/dev/null; then
        echo "🍺 Updating Homebrew formulas and casks..."
        brew update && brew upgrade && brew cleanup -s || echo "❌ Homebrew update failed."
    else
        echo "⚠️  Homebrew is not installed. Skipping."
    fi

    # 3. Oh My Zsh updates
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "💡 Updating Oh My Zsh..."
        omz update || echo "❌ Oh My Zsh update failed."
    fi

    # 4. Updating custom plugins
    ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    if [ -d "$ZSH_CUSTOM/plugins" ]; then
        echo "✨ Updating Oh My Zsh custom plugins..."
        for plugin in "$ZSH_CUSTOM/plugins"/*/; do
            if [ -d "$plugin/.git" ]; then
                echo "🔄 Updating $(basename "$plugin")..."
                git -C "$plugin" pull || echo "❌ Failed to update $(basename "$plugin")."
            fi
        done
    fi

    # 5. Vim/Neovim plugin updates
    if [ -f "$HOME/.vim/autoload/plug.vim" ]; then
        echo "📝 Updating Vim plugins..."
        vim +PlugUpdate +qall
    fi

    # 6. Cleanup
    echo "🧹 Final cleanup..."
    brew cleanup -s >/dev/null
    echo "✅ System and tools update completed successfully!"
}

# Create a directory and cd into it
function mkd() {
  mkdir -p "$@" && cd "$_"
}

# Find a directory and cd into it
function fcd() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
