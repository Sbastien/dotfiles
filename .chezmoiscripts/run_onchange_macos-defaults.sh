#!/bin/sh
set -eu

# macOS reads both the plain and the "2"-suffixed key; writing one alone does nothing.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# SCcf searches the current folder; the stock SCev searches the whole Mac.
defaults write com.apple.finder FXDefaultSearchScope -string SCcf
# Nlsv is list view. The alternatives are icnv, clmv and glyv.
defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
chflags nohidden "$HOME/Library"

defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1
# mru-spaces is Spaces reordering themselves by most recent use.
defaults write com.apple.dock mru-spaces -bool false
# showhidden dims the icons of hidden apps; it does not reveal anything.
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock show-recents -bool false

# One setting, three writes: the trackpad driver, this host, and every host.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# KeyRepeat runs 1-15 and InitialKeyRepeat 10-120. Lower is faster on both.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool true
# 3 lets Tab reach every control, not only text fields and lists.
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

defaults write com.apple.screencapture location -string "$HOME/Desktop"
defaults write com.apple.screencapture type -string png
defaults write com.apple.screencapture disable-shadow -bool true

# 4 is UTF-8, and listing it alone drops every other encoding from Terminal's menu.
defaults write com.apple.terminal StringEncodings -array 4
# Also blocks clipboard managers and text expanders while Terminal has focus.
defaults write com.apple.terminal SecureKeyboardEntry -bool true

defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# IconType 5 is CPU usage in the Dock icon; 0 is the app icon, 2 is CPU history.
defaults write com.apple.ActivityMonitor IconType -int 5
# 0 is every process, not just this user's.
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string CPUUsage
# 0 is descending.
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Everything above sits in cfprefsd until these three reload.
killall Dock Finder SystemUIServer 2>/dev/null || true

# sudo last, and deliberately: set -eu makes the first failing sudo a gate on
# every line under it, and an unattended run has no one to type the password.
# Puts the host name, OS version and IP behind the login window's clock.
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
