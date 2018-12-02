#!/usr/bin/env bash

set -e
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"
source ./utils/detect-os.sh

if [ "$OS" == 'macos' ]; then
    echo "Starting macOS Update"
    sudo softwareupdate -ia
    brew update
    brew upgrade --all
    ./setup/iterm.sh
elif [ "$OS" == 'linux' ]; then
    echo "Starting Linux Updates"
    sudo apt update
    sudo apt upgrade
fi

./setup/gitconfig.sh
