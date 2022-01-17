#!/usr/bin/env bash

set -eu;

if test ! -e /ide/bin/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quitting...\n' && exit 1;
} fi

# git 

SOURCE_DIR="$(readlink -f "$0")" && SOURCE_DIR="${SOURCE_DIR%/*}";
cat $SOURCE_DIR/.gitconfig >> $HOME/.gitconfig

# zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
echo "alias gits='git status'" >> $HOME/.zshrc
echo "alias ls='ls -GFh'" >> $HOME/.zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc
ln -s $SOURCE_DIR/.p10k.zsh $HOME/.p10k.zsh
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> $HOME/.zshrc