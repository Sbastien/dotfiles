# AGENTS.md

One Mac's configuration, declared. chezmoi does the work. A package name belongs
in the [Brewfile](https://github.com/Sbastien/Brewfile) repository; a file in
`$HOME` belongs here. Each file explains its own settings — this one carries only
what they cannot.

## The one rule

**Nothing work-related is ever written into this repository.** It is public: no
employer name, no internal host or service name, no employer directory path, no
real email address — not in a file, not in a comment, not in a fixture.

Work shell code goes in `~/.config/zshrc/local.zsh` and `secrets.zsh`, unmanaged
by design and sourced by `.zshrc`'s `*.zsh(N)` glob when they exist. The work
directory and every identity value live in machine-local
`~/.config/chezmoi/chezmoi.toml`, which is why `.chezmoi.toml.tmpl` prompts
through `promptStringOnce` — hardcode one into a template and it ships. No lint
rule can catch this. Only reading can.

## Traps

- **One owner per path in `$HOME`.** Two owners means one silently winning, and
  the loser is usually an unmanaged copy no tool ever opens again.
- **A template that renders empty is deleted, not written** — hence
  `dot_gitconfig.professional.tmpl` disappearing on a machine with no work email,
  and the `empty_` prefix on `~/.hushlogin`.

## Known gaps — deliberate, do not "fix"

- **No tests, no version pinning, no startup budget.** All three were here and
  removed: with one machine and one user, each cost more attention than it
  caught. CI was never here, and nothing here runs anywhere but this Mac.
- **`dot_config/mise/config.toml.tmpl` says `latest`, not a version.** It
  version-controls what `mise run lint` shells out to, not which version.

Run `mise run lint` before committing.
