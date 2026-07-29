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

<p align="center">
  <a href="https://github.com/Sbastien/Brewfile">Brewfile</a> •
  <a href="AGENTS.md">AGENTS.md</a>
</p>

<br>

> **This is my machine, made public.** Not a framework, not a product. Fork it,
> read it, take the parts you like — but expect it to change whenever my setup
> changes, and don't expect support.

## Install

```bash
chezmoi init --apply Sbastien
```

That assumes Homebrew and chezmoi are already there, and it configures tools it
does not install. On a Mac with neither, start at the other repository instead:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Sbastien/Brewfile/main/install.sh)
```

It installs Homebrew, then the packages, then offers to run the `chezmoi init`
above — so following it does this repository's install step too.

Either way you are prompted for a git author name and a personal email, then
optionally a work email and the directory work lives under. Answer the last two
and git swaps identity by path; leave them blank and the work half disappears
instead of shipping empty. The answers stay on the machine, in
`~/.config/chezmoi/chezmoi.toml`.

## What's in here

| | |
|---|---|
| `dot_zprofile`, `dot_zshrc`, `dot_config/zshrc/` | Homebrew's PATH, the interactive shell, then aliases and functions |
| `dot_gitconfig.tmpl` | git, delta as the pager, aliases, the conditional work identity |
| `dot_config/` | Ghostty, Starship, Neovim, mise's global tool versions and trusted paths |
| `.chezmoiexternal.toml` | three zsh plugins, cloned and refreshed by chezmoi |
| `.chezmoiscripts/` | macOS `defaults write`, re-run only when the script changes |
| `mise.toml` | the three tasks below |

## The shell

Zsh with no framework. `.zshrc` sets the environment, history and completion,
restores the keybindings and word behaviour the framework used to supply,
`eval`s the tools that ship their own init (mise, starship, fzf, zoxide,
worktrunk), sources the `~/.config/zshrc/*.zsh` glob, then loads the two plugins
that have to come last — syntax highlighting after everything, because it wraps
whichever ZLE widgets exist at the moment it is sourced. The plugins are
ordinary git clones under `~/.local/share/zsh/plugins`, declared in
`.chezmoiexternal.toml` and sourced by absolute path. chezmoi is the only plugin
manager involved.

Dropping Oh My Zsh removed around 4000 lines that were sourced at every shell
start: its core and lib, plus the git and fzf plugins. Measured on this Mac with
`hyperfine -N 'zsh -i -c exit'`, 106 ms against 160 ms with the framework.

Ghostty needs no help either. Shell integration defaults to `detect` and Ghostty
injects its own, so nothing terminal-specific is sourced from `.zshrc`.

Aliases mostly pin default flags onto the tools the
[Brewfile](https://github.com/Sbastien/Brewfile) installs — eza, bat, fd,
ripgrep, lazygit, docker, nvim — plus the usual navigation and network
shorthands. `du`, `df`, `ps`, `top` and `tree` are deliberately not among them:
they reach the real commands, and dust, duf, procs, btop and eza answer to their
own names. Swapping in a tool that takes different flags is how `ps aux` ends up
exiting 0 with the wrong answer.

## Development

```bash
mise run lint      # zsh -n per file, shellcheck + shfmt, and four silent-failure assertions
mise run fmt       # shfmt the macOS defaults script in place
mise run doctor    # chezmoi verify, then the Brewfile repository's package audit
```

`lint` splits by language because shellcheck and shfmt do not speak zsh. Its
last four checks each guard a failure that is otherwise invisible: a file falling
out of `.chezmoiignore` and being deployed into `$HOME`, a Ghostty key silently
dropped at launch, a missing trailing slash that would send every work commit out
under the personal email, and the work directory's name reaching a tracked file
in a public repository — which has already happened twice.

`doctor` audits configuration only. Packages belong to the
[Brewfile](https://github.com/Sbastien/Brewfile) repository, and `doctor` calls
that repository's own audit at `~/projects/Brewfile`.

There is no CI and there are no tests. [AGENTS.md](AGENTS.md) says why, and
carries the rules and traps the files cannot state about themselves.

---

<p align="center">
  Made with ♥ by <a href="https://github.com/Sbastien">Sbastien</a>
</p>
