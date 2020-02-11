export PATH=~/.composer/vendor/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ "$(uname)" = 'Darwin' ]; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
elif [ "$(uname)" = 'Linux' ]; then
    # export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
fi

if [[ -d ~/.gem/ruby/2.3.0/bin ]] ; then
    export PATH=~/.gem/ruby/2.3.0/bin:$PATH
fi
