# ============================================
# System Update
# ============================================
function update() {
    echo "Updating...\n"

    # Homebrew
    if command -v brew >/dev/null; then
        echo "\nHomebrew..."
        brew update && brew upgrade && brew cleanup -s && brew autoremove 2>/dev/null
    fi

    # Oh My Zsh
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "\nOh My Zsh..."
        omz update || true
    fi

    # Neovim plugins
    if command -v nvim >/dev/null && [ -d "$HOME/.local/share/nvim/lazy" ]; then
        echo "\nNeovim plugins..."
        nvim --headless -c 'Lazy! sync' -c 'qa'
    fi

    # mise runtimes
    if command -v mise >/dev/null; then
        echo "\nmise..."
        mise upgrade
    fi

    # npm global packages
    if command -v npm >/dev/null; then
        echo "\nnpm global..."
        npm update -g
    fi

    # Mac App Store
    if command -v mas >/dev/null; then
        echo "\nApp Store..."
        mas upgrade
    fi

    # Chezmoi
    if command -v chezmoi >/dev/null; then
        echo "\nDotfiles..."
        chezmoi update
    fi

    echo "\nDone."
}

# ============================================
# Utilities
# ============================================
function mkd() {
    mkdir -p "$@" && cd "$_"
}
