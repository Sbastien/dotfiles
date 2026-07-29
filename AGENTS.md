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

## Comments

Default to none. A comment earns its place only when it explains why — and that why isn't already in the code, the specs, or git history.

- **No "what"** — Restating a line, narrating steps ("first we…"), or logging history ("used to return nil"). If behavior needs documenting, write a spec; git covers what changed.
- **No empty "whys"** — Justifying with an always-true goal (consistency, readability, correctness) says nothing.
- **No session leaks** — "as discussed", rejected alternatives, anything written for a reader who was in the room.
- **Keep the real why** — A non-obvious choice's reason: external quirk (link the issue), timing/ordering constraint, magic number, actionable TODO/FIXME.

When unsure, delete — a missing comment is cheaper than a misleading one.

## Traps

- **One owner per path in `$HOME`.** Two owners means one silently winning, and
  the loser is usually an unmanaged copy no tool ever opens again.
- **A hex outside `dot_config/ghostty/config` has opted out of the palette.**
  Every other tool is told to inherit Ghostty's sixteen ANSI colours, so a
  hardcoded colour goes on rendering the old theme after a change and nothing says
  so. A style left unset does the same — delta's defaults are 24-bit, and only
  `delta --show-config` names them.
- **A template that renders empty is deleted, not written** — hence
  `dot_gitconfig.professional.tmpl` disappearing on a machine with no work email,
  and the `empty_` prefix on `~/.hushlogin`.
- **`~/.config/herdr/` is not managed here.** herdr writes its own
  `config.toml` into a directory it also fills with sockets, logs and session
  state, so managing that path would make chezmoi its second owner.

Run `mise run lint` before committing.
