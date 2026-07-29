# AGENTS.md

One Mac's configuration, declared. chezmoi does the work. A package name belongs
in the [Brewfile](https://github.com/Sbastien/Brewfile) repository; a file in
`$HOME` belongs here. Each file explains its own settings — this one carries only
what they cannot, and a change that makes the repository describe the machine
less accurately is a regression, however convenient it looks.

## The one rule

**Nothing work-related is ever written into this repository.** It is public: no
employer name, no internal host or service name, no employer directory path, no
real email address — not in a file, not in a comment, not in a fixture.

Work shell code goes in `~/.config/zshrc/local.zsh` and `secrets.zsh`, unmanaged
by design and sourced by `.zshrc`'s `*.zsh(N)` glob when they exist. The work
directory and every identity value live in machine-local
`~/.config/chezmoi/chezmoi.toml`, which is the whole reason `.chezmoi.toml.tmpl`
prompts through `promptStringOnce` — hardcode one into a template and it ships.
No lint rule can catch this. Only reading can.

## Traps

A trap earns a line here only if not knowing it makes you write a wrong change.
Not "this surprised us" — that belongs in the commit message, and `git log` keeps
it. Adding an entry is a claim that the next edit would go wrong without it.

- **One owner per path in `$HOME`.** Two owners means one silently winning: a
  half-finished Oh My Zsh migration loaded the unmanaged copy of three plugins
  over the managed one. The quieter variant is a second file the tool never
  opens — `core.excludesFile = ~/.gitignore` replaces git's XDG default, so a
  `~/.config/git/ignore` beside it holds rules that never apply. `git
  check-ignore -v` names the file that actually decided.
- **`.chezmoiignore` matches target paths.** A target name with no leading dot
  lands in `$HOME`, so every name in that file is there to stop a deploy, and
  `lint` fails if one falls out. `docs` is the entry to leave alone:
  `docs/superpowers/` is gitignored, but chezmoi reads the source tree from disk
  rather than from git, so dropping it deploys the local plan files to `$HOME`.
- **A template that renders empty is deleted, not written** — hence
  `dot_gitconfig.professional.tmpl` disappearing on a machine with no work email,
  and hence the `empty_` prefix on `~/.hushlogin`.
- **`zsh -n a b` exits 0 however broken `b` is**, because `b` becomes a
  positional parameter. Never collapse `lint`'s loop into one invocation.
- **mise renders every task `run` through Tera**, which reads a chezmoi
  `{{ .workDir }}` as its own syntax and refuses to parse the file. `lint`'s leak
  check wraps that call in `{% raw %}` for exactly this reason.
- **Do not alias `du`, `df`, `ps`, `top` or `tree`.** dust, duf, procs, btop and
  eza do not take those tools' flags, and some read an unrecognised argument as a
  query rather than an error: `ps aux` came back exit 0 listing one process. An
  alias that only adds flags to the tool it names — `ls` to eza, `vi` to nvim —
  is not that, and stays.

## Known gaps — deliberate, do not "fix"

- **No tests, no version pinning, no startup budget.** All three were here and
  all three were removed: with one machine and one user, each cost more attention
  than it caught. CI was never here, and nothing in the repository runs anywhere
  but this Mac.
- **The tools in `dot_config/mise/config.toml.tmpl` say `latest`, not a version.**
  That file exists to version-control what `mise run lint` shells out to, not to
  pin it. Pinning is the gap above.

Run `mise run lint` before committing.
