alias za="vim ~/.oh-my-zsh/custom/alias.zsh && . ~/.zshrc"

# programs
alias vsc="code ."

# directories
alias c="cd ~/code"
alias work="cd ~/work"

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

# python
alias pyenv="source ./env/bin/activate"

# macOS shortcuts
alias clearbadge="defaults write com.apple.systempreferences AttentionPrefBundleIDs 0 && killall Dock"
