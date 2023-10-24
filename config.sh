#!/bin/sh

password=$1

# apt
sudo apt install -y git terminator nfs-common openssh-server zsh python3-pip curl flameshot tmux cloudcompare

# git

git config --global user.email "daiwei.song@outlook.com"
git config --global user.name "Daiwei Song"

# zsg
chsh -s /bin/zsh

sudo mkdir -p ~/.oh-my-zsh
sudo mkdir -p ~/.config
sudo cp -R oh-my-zsh/* ~/.oh-my-zsh/
cp oh-my-zsh/.zshrc ~/

# terminator

mkdir ~/.config/terminator/
cp file/terminator_config ~/.config/terminator/config



cp file/flake8 ~/.config/flake8

# vim
sudo mkdir -p ~/.vim_runtime
sudo cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh

echo "====================="

# input
sudo apt-get install aptitude

sudo aptitude install fcitx-bin fcitx-table fcitx-config-gtk fcitx-frontend-all

# flameshot gui

echo "6. Success!"

# indicator-sysmonitor

sudo apt-get install -y indicator-sysmonitor
indicator-sysmonitor &

echo “set it to run on startup”

echo "cpu: {cpu} gpu: {nvgpu} mem: {mem}"

# python
# pip3 install flake8