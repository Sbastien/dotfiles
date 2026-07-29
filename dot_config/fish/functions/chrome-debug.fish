function chrome-debug --description "Chrome with the DevTools protocol open on 9222"
    # A function, not an alias: fish appends $argv to an alias body, which lands
    # after the & and will not parse.
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222 &
end
