#!/bin/bash

if test ! $(which brew); then
    echo "Installing homebrew"
fi

brew install alacritty
brew install docker
brew install fnm
brew install fzf
brew install git
brew install jq
brew install python
brew install starship
brew install yabai
brew install skhd
brew install zoxide
brew install tmux
brew install tmuxinator
brew install pipenv
brew install zsh

# install neovim
brew install neovim/neovim/neovim

exit 0
