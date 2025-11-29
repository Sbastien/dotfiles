# System and tools update function
function update() {
    echo "🔄 Starting system and tools update...\n"

    # 1. macOS updates (optional, skip with --skip-macos)
    if [[ "$*" != *"--skip-macos"* ]]; then
        echo "🖥  Checking macOS updates..."
        sudo softwareupdate -i -a || echo "❌ macOS updates failed."
        echo ""
    fi

    # 2. Homebrew updates
    if command -v brew >/dev/null; then
        echo "🍺 Updating Homebrew..."
        brew update
        echo "\n📦 Upgrading packages..."
        brew upgrade
        echo "\n🧹 Cleaning up Homebrew..."
        brew cleanup -s
        brew autoremove 2>/dev/null
        echo ""
    fi

    # 3. Oh My Zsh updates
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "💡 Updating Oh My Zsh..."
        omz update || echo "❌ Oh My Zsh update failed."
        echo ""
    fi

    # 4. Neovim plugins (Lazy.nvim)
    if command -v nvim >/dev/null && [ -d "$HOME/.local/share/nvim/lazy" ]; then
        echo "📝 Updating Neovim plugins..."
        nvim --headless "+Lazy! sync" +qa
        echo ""
    fi

    # 5. mise (runtime manager)
    if command -v mise >/dev/null; then
        echo "🔧 Updating mise and tools..."
        mise self-update 2>/dev/null || true
        mise upgrade
        echo ""
    fi

    # 6. Chezmoi (dotfiles + zsh plugins via .chezmoiexternal.toml)
    if command -v chezmoi >/dev/null; then
        echo "⚙️  Updating dotfiles..."
        chezmoi update
        echo ""
    fi

    echo "✅ Update completed!\n"
    echo "💡 Run 'brew doctor' if you encounter issues."
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

# Extract any archive
function extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Quick backup of a file
function backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Initialize zoxide with common directories
function zoxide-init-dirs() {
  local dirs=(
    "$HOME/projects"
    "$HOME/Library/Mobile Documents/com~apple~CloudDocs"
    "$HOME/.local/share/chezmoi"
    "$HOME/Documents"
    "$HOME/Downloads"
  )

  for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
      zoxide add "$dir"
      echo "Added: $dir"
    fi
  done
  echo "✅ Zoxide initialized with common directories"
}

# Safe chezmoi apply with preview
function dotfiles-apply() {
  echo "📋 Preview of changes:"
  chezmoi diff
  echo ""
  read "response?Apply these changes? (y/N) "
  if [[ "$response" =~ ^[Yy]$ ]]; then
    chezmoi apply
    echo "✅ Dotfiles applied!"
    echo "♻️  Reloading shell..."
    reload
  else
    echo "❌ Cancelled"
  fi
}

