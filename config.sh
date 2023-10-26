#!/bin/sh

password=$1

# apt
echo $password | sudo -S apt install -y git terminator nfs-common openssh-server zsh python3-pip curl flameshot tmux cloudcompare wireshark
# printer
# echo $password | sudo -S apt install samba-client python3-smbc smbclient
# echo $password | sudo -Ssystemctl restart cups.service


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


# flake8
cp file/flake8 ~/.config/flake8

# vim
echo $password | sudo -S mkdir -p ~/.vim_runtime
echo $password | sudo -S cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh

# input
echo $password | sudo -S apt-get install -y aptitude
echo $password | sudo -S aptitude install fcitx-bin fcitx-table fcitx-config-gtk fcitx-frontend-all

# flameshot gui

echo "6. Success!"

# indicator-sysmonitor

echo $password | sudo -S apt-get install -y indicator-sysmonitor
indicator-sysmonitor &
echo “set it to run on startup”
echo "cpu: {cpu} gpu: {nvgpu} mem: {mem}"

# python
# pip3 install flake8

# VS Code right click menu
touch ~/.local/share/nautilus/scripts/Open-in-VSCode
echo "code ./$1" > ~/.local/share/nautilus/scripts/Open-in-VSCode