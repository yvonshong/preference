#!/bin/sh

password=$1

# apt
echo $password | sudo -S apt install -y git nfs-common openssh-server zsh curl tmux
echo $password | sudo -S apt install -y cloudcompare terminator


# printer
# echo $password | sudo -S apt install samba-client python3-smbc smbclient
# echo $password | sudo -Ssystemctl restart cups.service


# git
git config --global user.email "yvon-shong@foxmail.com"
git config --global user.name "Yvon"

# zsg
chsh -s /bin/zsh

echo $password | sudo -S  mkdir -p ~/.oh-my-zsh
echo $password | sudo -S  mkdir -p ~/.config
echo $password | sudo -S  cp -R oh-my-zsh/* ~/.oh-my-zsh/
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
echo $password | sudo -S aptitude install -y fcitx5 fcitx-bin fcitx-table fcitx-config-gtk fcitx-frontend-all
echo $password | sudo -S aptitude install -y qtcreator qml-module-qtquick-controls2

# flameshot gui


# indicator-sysmonitor

# echo $password | sudo -S apt-get install -y indicator-sysmonitor
# indicator-sysmonitor &
# echo “set it to run on startup”
# echo "cpu: {cpu} gpu: {nvgpu} mem: {mem}"


# # VS Code right click menu
# touch ~/.local/share/nautilus/scripts/Open-in-VSCode
# echo "code ./$1" > ~/.local/share/nautilus/scripts/Open-in-VSCode