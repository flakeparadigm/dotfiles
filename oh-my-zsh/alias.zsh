alias za="vim ~/.oh-my-zsh/custom/alias.zsh && . ~/.zshrc"

# programs
alias a="atom ."
alias vsc="code ."

# directories
alias c="cd ~/salt-developer/code"
alias ca="cd ~/salt-developer/code/api"

# git
alias gb="git checkout -b"
alias gfd="git diff --name-only HEAD..develop"
alias gl="git log --oneline -20 --decorate"
alias gp="git pull && git submodule update && git status"
alias gpf="git push --force-with-lease"
alias gr="git rebase"
alias gs="git status"
alias gss="git stash show -p"

# vg
alias vt="vgtest run -t"
alias vw="vgutil workflow"
alias vb="vgbuild dev"
alias vbw="vgbuild watch"

# env
alias vgdbg="DEBUGGER=true LRN_VG_VARS=DEBUGGER"
