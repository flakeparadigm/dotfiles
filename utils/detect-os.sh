#!/usr/bin/env bash

if [ "$(uname)" == 'Linux' ]; then
  export OS=linux
elif [ "$(uname)" == 'Darwin' ]; then
  export OS=macos
fi
