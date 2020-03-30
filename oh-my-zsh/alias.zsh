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
alias gl="git log --oneline -30 --decorate --graph"
alias gp="git pull && git submodule update && git status"
alias gpf="git push --force-with-lease"
alias gr="git rebase"
alias gs="git status"
alias gss="git stash show -p"
alias gcp="git cherry-pick -x"

# vg
alias vt="vgtest run -t"
alias vw="vgutil workflow"
alias vb="vgbuild dev"
alias vbw="vgbuild watch"
alias vgsyslog="vgutil run \"sudo journalctl -f\""

# env
alias vgdbg="DEBUGGER=true LRN_VG_VARS=DEBUGGER"

# PHP
alias pbc="php bin/console"

# python
alias pyenv="source ./env/bin/activate"

# macOS shortcuts
alias clearbadge="defaults write com.apple.systempreferences AttentionPrefBundleIDs 0 && killall Dock"

