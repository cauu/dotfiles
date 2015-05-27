#!/bin/sh

#Install zsh
brew install zsh

chsh -s $(which zsh)

# cd ~
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh