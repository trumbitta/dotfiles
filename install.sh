#!/usr/bin/env bash

set -eu;

if test ! -e /ide/bin/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quitting...\n' && exit 1;
} fi

SOURCE_DIR="$(readlink -f "$0")" && _source_dir="${_source_dir%/*}";
cat $SOURCE_DIR/.dotfiles/.gitconfig >> $HOME/.gitconfig