#!/usr/bin/env bash

# Setup git configuration.
# This script is preferred over a set config file because key and repo configs
# may differ between each machine.

git config --global branch.autosetuprebase always
git config --global diff.submodule log
git config --global merge.conflictstyle diff3
git config --global remote.origin.prune true
git config --global remote.origin.tagOpt '--tags'
git config --global rebase.autosquash true
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global tag.sort version:refname
