export PATH=~/.composer/vendor/bin:~/work/lde/bin:$PATH

if [ "$(uname)" = 'Darwin' ]; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
elif [ "$(uname)" = 'Linux' ]; then
    # export GPG_TTY=$(tty)
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
fi
