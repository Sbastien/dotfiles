function update --description "Upgrade Homebrew, mise and the dotfiles"
    set -l failed

    echo "Homebrew..."
    brew update; and brew upgrade; and brew autoremove; and brew cleanup -s
    or set -a failed homebrew

    echo
    echo "mise..."
    mise upgrade; or set -a failed mise
    # `mise upgrade` keeps the version it replaces.
    mise prune

    echo
    echo "Dotfiles..."
    # Pulls and applies, so the macOS defaults script may ask for sudo.
    chezmoi update; or set -a failed dotfiles

    if test (count $failed) -gt 0
        echo
        echo "Failed: $failed"
        return 1
    end
    echo
    echo "Done."
end
