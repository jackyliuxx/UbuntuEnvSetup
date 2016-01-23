#!/bin/bash
install_gcc_5="YES"
install_clang_36="YES"
git_username="jackyliuxx"
git_email="jackyliuxx@gamil.com"


sudo=""
if [ $(id -u) != 0 ];then
    sudo="sudo"
fi

if [ $install_gcc_5 == "YES" ];then
    $sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
fi

$sudo apt-get update

$sudo apt-get install -y wget curl build-essential cmake python-dev python3 python3-dev python3-pip mysql-client libmysqlclient-dev clang tmux

#clang-3.6
if [ $install_clang_36 == "YES" ];then
    $sudo apt-get install -y clang-3.6
    $sudo rm -f /usr/bin/clang /usr/bin/clang++
    $sudo ln -s /usr/bin/clang-3.6 /usr/bin/clang
    $sudo ln -s /usr/bin/clang++-3.6 /usr/bin/clang++
fi

#g++ 5
if [ $install_gcc_5 == "YES" ];then
    $sudo apt-get install -y g++-5
    $sudo rm -f /usr/bin/gcc /usr/bin/g++
    $sudo ln -s /usr/bin/gcc-5 /usr/bin/gcc
    $sudo ln -s /usr/bin/g++-5 /usr/bin/g++
fi

#git
$sudo apt-get install -y git
git config --global user.name $git_name
git config --global user.email $git_email
git config --global core.editor vim
git config --global push.default simple

#powerline fonts
git clone https://github.com/powerline/fonts.git ./powerlinefonts
./powerlinefonts/install.sh
rm -rf powerlinefonts

#zsh
$sudo apt-get install -y zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="rkj-repos"/g' ~/.zshrc

#vim
git clone https://github.com/jackyliuxx/.vim.git ~/.vim
~/.vim/setup.sh
