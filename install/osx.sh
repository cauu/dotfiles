#!/bin/sh

# Install Homebrew & brew-cask

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask
brew tap homebrew/versions
brew tap caskroom/versions

# Install brew & brew-cask packages

source "$DOTFILES_DIR/install/brew.sh"
source "$DOTFILES_DIR/install/brew-cask.sh"

# Install zsh (with Homebrew)

source "$DOTFILES_DIR/install/zsh.sh"

# Install pip&virtual environment

source "$DOTFILES_DIR/install/python.sh"

# http://www.sublimetext.com/docs/3/osx_command_line.html
[ -f ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ] && ln -sfv ~/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "$DOTFILES_DIR/bin/subl"

