<h1 align="center">
  <br>
  ⚙️ dotfiles
  <br>
</h1>

<h4 align="center">Modern macOS development environment managed with chezmoi.</h4>

<p align="center">
  <a href="https://github.com/Sbastien/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/Sbastien/dotfiles?style=for-the-badge&color=81C784" alt="Last Commit"></a>
  <a href="https://www.chezmoi.io/"><img src="https://img.shields.io/badge/managed%20with-chezmoi-blue?style=for-the-badge" alt="chezmoi"></a>
</p>

<p align="center">
  <a href="https://www.apple.com/macos"><img src="https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS"></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/Zsh-F15A24?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Zsh"></a>
</p>

<p align="center">
  <strong>Zsh + Oh My Zsh · Starship prompt · Modern CLI tools · macOS defaults</strong>
</p>

<p align="center">
  <a href="https://github.com/Sbastien/Brewfile">Brewfile</a> •
  <a href="#quick-install">Install</a> •
  <a href="#whats-included">Features</a>
</p>

<br>

## Quick Install

```bash
chezmoi init --apply Sbastien
```

<details>
<summary>First time setup</summary>
<br>

Install dependencies with [Brewfile](https://github.com/Sbastien/Brewfile) or manually:

```bash
brew install chezmoi zsh starship zoxide
brew install bat eza fd ripgrep fzf btop dust duf procs
brew install git git-delta lazygit neovim mise jq yq
```

Create local git config:

```bash
cat <<EOF > ~/.gitconfig.local
[user]
    name = Your Name
    email = your.email@example.com
EOF
```

Apply dotfiles:

```bash
chezmoi init --apply Sbastien
```

</details>

## What's Included

- **Shell** — Zsh, Oh My Zsh, Starship prompt, Zoxide
- **CLI Tools** — bat, eza, fd, ripgrep, fzf, btop, dust, duf, procs
- **Git** — Delta pager, lazygit, useful aliases
- **Editor** — Neovim (minimal config)
- **Runtime** — mise (Node, Python, Ruby, etc.)
- **macOS** — Automated system defaults (Dock, Finder, keyboard)

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

My [Brewfile](https://github.com/Sbastien/Brewfile) installs the tools — these dotfiles configure them.

<br>

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/Sbastien">Sebastien</a>
</p>

<p align="center">
  <sub>Automate the boring stuff, focus on building amazing things.</sub>
</p>
