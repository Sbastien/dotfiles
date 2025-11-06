# dotfiles

[![chezmoi](https://img.shields.io/badge/managed%20with-chezmoi-blue)](https://www.chezmoi.io/)

Modern macOS development environment managed with [chezmoi](https://www.chezmoi.io/).

## Features

- **Zsh + Oh My Zsh** - Enhanced shell with plugins (syntax-highlighting, autosuggestions, completions)
- **Starship** - Fast, customizable prompt with git integration
- **Modern CLI tools** - Better alternatives to cat, ls, find, grep (bat, eza, fd, ripgrep)
- **Git configuration** - Delta integration for beautiful diffs, useful aliases
- **Neovim** - Minimal configuration optimized for quick edits and git commits
- **Productivity aliases** - Shortcuts for Docker, system monitoring, and common tasks

## Prerequisites

Install tools via [macgyver](https://github.com/Sbastien/macgyver) or manually with Homebrew:

```bash
# Core requirements
brew install zsh starship zoxide chezmoi

# Modern CLI tools
brew install bat eza fd ripgrep fzf btop dust duf procs

# Development tools
brew install git git-delta lazygit neovim asdf jq yq

# Optional
brew install lazydocker
```

Oh My Zsh and plugins are installed automatically via chezmoi.

## Installation

```bash
# 1. Create local git config (not tracked)
cat <<EOF > ~/.gitconfig.local
[user]
    name = Your Name
    email = your.email@example.com
EOF

# 2. Initialize and apply dotfiles
chezmoi init --apply Sbastien

# 3. Restart terminal
```

## What's Included

- **Shell**: Zsh with Oh My Zsh, Starship prompt, Zoxide
- **Git**: Delta pager, useful aliases, auto-rebase/push
- **Neovim**: Minimal config for quick edits and git commits
- **CLI Tools**: Modern replacements (bat, eza, fd, ripgrep, btop, etc.)
- **Functions**: System updates, file extraction, backups, dotfile management

## Usage

```bash
# Edit and apply dotfiles
chezmoi edit ~/.zshrc
chezmoi diff
dotfiles-apply

# Update system and tools
update

# Jump to directories (zoxide)
z projects
z dot
```

## Structure

```
~/.config/
├── starship.toml           # Prompt configuration
└── zshrc/
    ├── init.zsh            # Oh My Zsh initialization
    ├── aliases.zsh         # Shell aliases
    └── functions.zsh       # Custom functions

~/.gitconfig                # Git config (includes ~/.gitconfig.local)
~/.zshrc                    # Shell entry point
~/.zprofile                 # Environment variables
~/.config/nvim/init.lua     # Neovim configuration
```

## Customization

- **Aliases**: Edit `~/.config/zshrc/aliases.zsh`
- **Functions**: Edit `~/.config/zshrc/functions.zsh`
- **Git**: Edit `~/.gitconfig` or `~/.gitconfig.local`

## Related Projects

- [macgyver](https://github.com/Sbastien/macgyver) - Automated macOS setup and package installation

---

---

## License

Personal configuration. Feel free to fork and adapt.

## ⭐ Show Your Support

If this project helped you set up your Mac, give it a ⭐️! It helps others discover it.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Sbastien">Sebastien</a>
</p>

<p align="center">
  <sub>Automate the boring stuff, focus on building amazing things.</sub>
</p>
