<h1 align="center">
  <br>
  ⚙️ dotfiles
  <br>
</h1>

<h4 align="center">Modern macOS development environment managed with chezmoi.</h4>

<br>

<p align="center">
  <a href="https://github.com/Sbastien/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/Sbastien/dotfiles?color=81C784" alt="Last Commit"></a>
  <a href="https://www.chezmoi.io/"><img src="https://img.shields.io/badge/managed%20with-chezmoi-blue" alt="chezmoi"></a>
  <a href="https://www.apple.com/macos"><img src="https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=white" alt="macOS"></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=white" alt="Zsh"></a>
</p>

<br>

## Install

First, install dependencies using the [Brewfile](https://github.com/Sbastien/Brewfile), then:

```bash
chezmoi init --apply Sbastien
```

You'll be prompted for your git identity. Supports separate emails for personal and work projects.

## What's Included

- **Shell** — Zsh, Oh My Zsh, Starship prompt, Zoxide
- **CLI Tools** — bat, eza, fd, ripgrep, fzf, btop, dust, duf, procs
- **Git** — Delta pager, lazygit, personal/professional email support
- **Editor** — Neovim (minimal config)
- **Runtime** — mise (Node, Python, Ruby, etc.)
- **macOS** — Automated system defaults (Dock, Finder, keyboard)

---

<p align="center">
  Made with ♥ by <a href="https://github.com/Sbastien">Sbastien</a>
</p>
