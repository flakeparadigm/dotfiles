#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
#brew install gnu-sed --with-default-names

# Install ZSH.
brew install zsh

# We installed the new shell, now we have to activate it
echo "Setting default shell to Brew version of ZSH"
# Change to the new shell, prompts for password
#sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
#chsh -s /usr/local/bin/zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Install `wget`.
brew install wget

# Install Python
brew install python

# Install other useful binaries.
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install gnupg
brew install pinentry-mac
brew install gh
brew install ssh-copy-id
brew install thefuck
brew install tree
brew install xz

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Core casks
brew cask install --appdir="/Applications" iterm2

# Development tool casks
brew cask install --appdir="/Applications" visual-studio-code

# Browser casks
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex

# Make it possible to remove package w/deps
brew tap beeftornado/rmtree

# Install custom fonts
brew tap homebrew/cask-fonts
brew install font-fira-code

# Remove outdated versions from the cellar.
brew cleanup
