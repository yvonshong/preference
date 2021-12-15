#!/bin/sh
sudo apt install -y git terminator nfs-common openssh-server zsh python3-pip curl flameshot
git config --global user.email "daiwei.song@tusimple.ai" 
git config --global user.name "Daiwei Song"

chsh -s /bin/zsh


sudo pip install flake8
sudo mkdir -p ~/.vim_runtime
sudo mkdir -p ~/.oh-my-zsh
sudo mkdir -p ~/.config
sudo cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh
sudo cp -R oh-my-zsh/* ~/.oh-my-zsh/
chsh -s /bin/zsh
cp oh-my-zsh/.zshrc ~/
cp flake8 ~/.config/flake8

echo "====================="

sudo apt-get install aptitude 

sudo aptitude install fcitx-bin fcitx-table fcitx-config-gtk fcitx-frontend-all 

 # flameshot gui

echo "6. Success!"
