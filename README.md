<h1 align="center">
  <br>
  ⚙️ dotfiles
  <br>
</h1>

<h4 align="center">My macOS configuration, managed with chezmoi.</h4>

<br>

<p align="center">
  <a href="https://github.com/Sbastien/dotfiles/commits"><img src="https://img.shields.io/github/last-commit/Sbastien/dotfiles?color=81C784" alt="Last Commit"></a>
  <a href="https://www.chezmoi.io/"><img src="https://img.shields.io/badge/managed%20with-chezmoi-blue" alt="chezmoi"></a>
  <a href="https://www.apple.com/macos"><img src="https://img.shields.io/badge/macOS-000000?logo=apple&logoColor=white" alt="macOS"></a>
  <a href="https://www.zsh.org/"><img src="https://img.shields.io/badge/Zsh-F15A24?logo=zsh&logoColor=white" alt="Zsh"></a>
</p>

<br>

> **This is my machine, made public.** Not a framework, not a product. Fork it,
> read it, take the parts you like — but expect it to change whenever my setup
> changes, and don't expect support.

Zsh with no framework, Ghostty, Starship, Neovim, git, mise and the macOS
defaults. Configured here; installed from the
[Brewfile](https://github.com/Sbastien/Brewfile) repository.

## Install

```bash
chezmoi init --apply Sbastien
```

Assumes Homebrew and chezmoi are already there. On a fresh Mac, start at the
[Brewfile](https://github.com/Sbastien/Brewfile) repository instead — it installs
both, then offers to run the command above:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Sbastien/Brewfile/main/install.sh)
```

Either way you are prompted for a git author name and a personal email, then
optionally a work email and the directory work lives under. Answer the last two
and git swaps identity by path; leave them blank and the work half disappears
instead of shipping empty. The answers stay on the machine, in
`~/.config/chezmoi/chezmoi.toml`.

## Tasks

```bash
mise run lint      # zsh -n per file, shellcheck + shfmt, and four silent-failure assertions
mise run fmt       # shfmt the macOS defaults script in place
mise run doctor    # chezmoi verify, then the Brewfile repository's package audit
```

---

<p align="center">
  Made with ♥ by <a href="https://github.com/Sbastien">Sbastien</a>
</p>
