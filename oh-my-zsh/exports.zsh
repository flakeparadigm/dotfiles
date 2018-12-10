# export PATH=~/Library/Python/2.7/bin:$PATH:/Users/tyler/salt-developer/scripts
# export PATH=~/go/bin:$PATH

export GPG_TTY=$(tty)

if [ "$(uname)" = 'Darwin' ]; then
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent > /dev/null 2>&1
elif [ "$(uname)" = 'Linux' ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
fi
