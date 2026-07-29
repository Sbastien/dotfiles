update() {
    local failed=()

    echo "Homebrew..."
    brew update && brew upgrade && brew autoremove && brew cleanup -s || failed+=(homebrew)

    echo "\nmise..."
    mise upgrade || failed+=(mise)
    # `mise upgrade` keeps the version it replaces.
    mise prune

    echo "\nDotfiles..."
    # Pulls and applies, so the macOS defaults script may ask for sudo.
    chezmoi update || failed+=(dotfiles)

    if (( $#failed )); then
        echo "\nFailed: $failed"
        return 1
    fi
    echo "\nDone."
}

mkd() {
    mkdir -p "$@" && cd "$_"
}
