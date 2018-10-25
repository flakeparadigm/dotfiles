#!/usr/bin/env bash
# Reference: https://github.com/donnemartin/dev-setup

set -e
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"
./detect-os.sh



cat ./suggested-apps.txt
