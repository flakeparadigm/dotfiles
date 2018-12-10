#!/usr/bin/env bash
# Reference: https://github.com/donnemartin/dev-setup

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"
source ./utils/detect-os.sh

if [ "$OS" == 'macos' ] && ! xcode-select -p | grep 'CommandLineTools' &> /dev/null; then
    echo "Installing Command Line Tools. Re-run this script when completed."
    ./setup/macos-prep.sh
    exit
fi

if [ "$OS" == 'macos' ]; then
    echo "Starting macOS Setup"
    ./setup/brew.sh
    ./setup/macos.sh
    ./setup/darkmode.sh
elif [ "$OS" == 'linux' ]; then
    echo "Starting Linux Setup"
fi

# Add ability to use the zip version of this repo
if ! git rev-parse --git-dir &> /dev/null; then
    git init
    rm -rf ./dotbot
    git submodule add https://github.com/anishathalye/dotbot
fi

# Install Oh-my-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Dotbot and Git setups
./install
./setup/gitconfig.sh

# Fix this repo to use the proper ssh remotes now that git is configured
GIT_REMOTE=git@github.com:flakeparadigm/dotfiles.git
if ! git remote set-url origin $GIT_REMOTE &> /dev/null; then
    git remote add origin $GIT_REMOTE
fi
git fetch

# Cleanup any changes that may have occurred in the repo during setup
read -p "Reset repo? (y/N) " GIT_RESET
if [ "$GIT_RESET" == 'y' ]; then
    set -e
    git checkout -b master
    git branch -u origin/master
    git reset --hard origin/master
    unset -e
fi

cat ./suggested-apps.txt
