#!/usr/bin/env bash

set -e
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASEDIR}"
./detect-os.sh
