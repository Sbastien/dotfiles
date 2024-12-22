Create gitconfig.local
```bash
cat <<EOF > ~/.gitconfig.local
[user]
    name = John Doe
    email = john.doe@example.com
EOF
```

Setup with chezmoi
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply Sbastien
```

Remove `chezmoi` binary since it has been installed by Homebrew
```bash
rm -f ~/.local/bin/chezmoi
```
