#!/bin/bash
git_username="jackyliuxx"
git_email="jackyliuxx@gamil.com"


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
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
sed -i 's/^ZSH_THEME="robbyrussell"/ZSH_THEME="rkj-repos"/' ~/.zshrc

#vim
bash -c "$(wget https://raw.githubusercontent.com/jackyliuxx/.vim/master/setup.sh -O -)"
