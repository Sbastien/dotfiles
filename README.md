<p align="center">
  <h1 align="center">⚙️ dotfiles</h1>
  <p align="center">Modern macOS development environment managed with chezmoi</p>
</p>

<p align="center">
  <a href="https://github.com/Sbastien/dotfiles/actions"><img src="https://img.shields.io/github/actions/workflow/status/Sbastien/dotfiles/ci.yml?label=CI" alt="CI"></a>
  <a href="https://github.com/Sbastien/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/Sbastien/dotfiles" alt="Last Commit"></a>
  <a href="https://www.chezmoi.io/"><img src="https://img.shields.io/badge/managed%20with-chezmoi-blue" alt="chezmoi"></a>
  <a href="#license"><img src="https://img.shields.io/badge/license-MIT-green" alt="License"></a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=white" alt="macOS">
  <img src="https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=white" alt="Zsh">
  <img src="https://img.shields.io/badge/Neovim-57A143?logo=neovim&logoColor=white" alt="Neovim">
</p>

<p align="center">
  <b>Zsh + Oh My Zsh · Starship prompt · Modern CLI tools · macOS defaults</b>
</p>

<p align="center">
  <a href="https://github.com/Sbastien/Brewfile">Brewfile</a> •
  <a href="#quick-install">Install</a> •
  <a href="#whats-included">Features</a>
</p>

---

## Quick Install

```bash
chezmoi init --apply Sbastien
```

<details>
<summary>First time setup</summary>

```bash
# 1. Install dependencies (or use Brewfile)
brew install chezmoi zsh starship zoxide
brew install bat eza fd ripgrep fzf btop dust duf procs
brew install git git-delta lazygit neovim mise jq yq

# 2. Create local git config
cat <<EOF > ~/.gitconfig.local
[user]
    name = Your Name
    email = your.email@example.com
EOF

# 3. Apply dotfiles
chezmoi init --apply Sbastien

# 4. Restart terminal
```

</details>

## What's Included

| Category | Tools |
|----------|-------|
| **Shell** | Zsh, Oh My Zsh, Starship prompt, Zoxide |
| **CLI** | bat, eza, fd, ripgrep, fzf, btop, dust, duf, procs |
| **Git** | Delta pager, lazygit, useful aliases |
| **Editor** | Neovim (minimal config) |
| **Runtime** | mise (Node, Python, Ruby, etc.) |
| **macOS** | Automated system defaults (Dock, Finder, keyboard) |

## Structure

```text
~/.config/
├── starship.toml        # Prompt configuration
├── nvim/init.lua        # Neovim config
└── zshrc/
    ├── init.zsh         # Oh My Zsh setup
    ├── aliases.zsh      # Shell aliases
    └── functions.zsh    # Custom functions

~/.zshrc                 # Entry point
~/.zprofile              # Environment variables
~/.gitconfig             # Git config
```

## Usage

```bash
# Edit dotfiles
chezmoi cd && code .

# Preview changes
chezmoi diff

# Apply changes
chezmoi apply

# Update everything (brew, nvim plugins, dotfiles)
update
```

## Related

- **[Brewfile](https://github.com/Sbastien/Brewfile)** — Homebrew packages (installs the tools)
- **dotfiles** — Configuration (configures the tools)

---

## License

MIT — feel free to fork and adapt.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Sbastien">Sebastien</a>
</p>

<p align="center">
  <sub>Automate the boring stuff, focus on building amazing things.</sub>
</p>
