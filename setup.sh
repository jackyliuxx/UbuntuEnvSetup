#!/bin/bash
sudo=""
if [ $(id -u) != 0 ];then
    sudo="sudo "
fi
$sudo apt-get update
$sudo apt-get install -y git
#git clone https://github.com/jackyliuxx/.vim.git ~/.vim
#~/.vim/setup.sh
