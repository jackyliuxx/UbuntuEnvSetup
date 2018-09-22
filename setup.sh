#!/bin/bash
git_username="jackyliuxx"
git_email="jackyliuxx@gamil.com"


sudo=""
if [[ $(id -u) -ne 0 ]];then
    sudo="sudo"
fi

$sudo apt-get update

$sudo apt-get install -y wget \
                         curl \
                         build-essential \
                         cmake \
                         python-dev \
                         python3 \
                         python3-dev \
                         python3-pip \
                         mysql-client \
                         libmysqlclient-dev \
                         clang \
                         tmux

#git
$sudo apt-get install -y git
git config --global user.name $git_name
git config --global user.email $git_email
git config --global core.editor vim
git config --global push.default simple

#powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
echo 'source-file "${HOME}/.tmux-themepack/powerline/double/yellow.tmuxtheme"' > ~/.tmux.conf

#zsh
$sudo apt-get install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="rkj-repos"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git pip)/g' ~/.zshrc
echo 'alias tmux="TERM=xterm-256color tmux"' >> ~/.zshrc

#nodejs
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

#vim
git clone https://github.com/jackyliuxx/.vim.git ~/.vim
~/.vim/setup.sh
