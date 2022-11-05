#!/bin/bash
git_name="jackyliuxx"
git_email="jackyliuxx@gmail.com"


sudo=""
if [[ $(id -u) != 0 ]];then
    sudo="sudo"
fi

$sudo apt-get update
$sudo apt-get install -y wget curl clang tmux

#git
$sudo apt-get install -y git
git config --global user.name "$git_name"
git config --global user.email "$git_email"
git config --global core.editor vim
git config --global push.default simple

#zsh
$sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
$sudo chsh "$USER" -s $(which zsh)
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="rkj-repos"/' ~/.zshrc

#vim
bash -c "$(wget https://raw.githubusercontent.com/jackyliuxx/.vim/master/setup.sh -O -)"
