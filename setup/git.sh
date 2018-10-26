#!/usr/bin/env bash

# Setup basic git settings and security
source ./utils/detect-os.sh

# Perform initial setup of name, email, and SSH key
read -p "Prompt for initial Git config? (y/N) " DO_INITIAL_CONFIG
if [ "$DO_INITIAL_CONFIG" == 'y' ]; then
    read -p "Name: " GIT_NAME
    git config --global user.name "$GIT_NAME"

    read -p "Email: " GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"

    read -p "Create a new SSH key? (y/N) " CREATE_SSH_KEY
    if [ "$CREATE_SSH_KEY" == 'y' ]; then
        ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL"
    fi

    if [ -e ~/.ssh/id_rsa.pub ]; then
        echo ""
        echo "Copy your public key from below:"
        cat ~/.ssh/id_rsa.pub

        echo ""
        echo "Now add your SSH Key to your GitHub account: https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/"
    fi

    echo "SUGGESTION: Add SSH Key to agent. https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#adding-your-ssh-key-to-the-ssh-agent"

    read -p "When done, press enter to continue."
fi

# Perform initial setup of PHP key signing, including signing by default.
read -p "Setup GPG commit signing? (y/N) " CONFIGURE_GPG
if [ "$CONFIGURE_GPG" == 'y' ]; then
    read -p "Create a new GPG key? (y/N) " CREATE_GPG_KEY
    if [ "$CREATE_GPG_KEY" == 'y' ]; then
        echo "Generate an 'RSA & RSA' keypair with a large size, like 4096"
        gpg --full-generate-key
    fi

    gpg --list-secret-keys --keyid-format LONG

    echo "Choose a key from above to use for signing git commits. https://help.github.com/articles/telling-git-about-your-signing-key/"
    read -p "Key ID: " GPG_KEY_ID

    git config --global user.signingkey $GPG_KEY_ID
    git config commit.gpgsign true

    echo ""
    echo "Copy your public key from below:"
    gpg --armor --export $GPG_KEY_ID

    echo ""
    echo "Now add this key to your GitHub account. https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/"

    read -p "When done, press enter to continue."
fi
