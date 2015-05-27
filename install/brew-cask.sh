#!/bin/sh

apps=(
    alfred
    cornerstone
    dash
    dropbox
    flux
    glimmerblocker
    google-chrome
    google-chrome-canary
    google-drive
    iterm2
    kaleidoscope
    mou
    screenflow
    sourcetree
    sublime-text3
    skype
    transmit
    webstorm
)

brew cask install ${apps[@]}

