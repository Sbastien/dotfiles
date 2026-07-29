# Deliberately empty. Shadows Homebrew's
# share/fish/vendor_conf.d/mise-activate.fish by filename, so `mise activate` is
# not run twice per shell: config.fish has to run it after fish_add_path to keep
# mise ahead of ~/.local/bin, and the vendor copy would already have run.
# If mise ever renames its file this stops matching, and the only symptom is the
# duplicate subprocess coming back.
