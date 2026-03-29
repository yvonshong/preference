#!/bin/bash

password=$1

# 提前认证提权（可选，避免后续弹出密码输入框）
if [ -n "$password" ]; then
    echo "$password" | sudo -S -v
fi

# Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew packages (macOS built-in nfs/ssh, installing essentials)
brew install git tmux zsh python

# Development & Productivity Apps (Casks)
echo "Installing applications..."

# Terminal & Dev Tools
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask cloudcompare
brew install --cask tailscale
brew install --cask windows-app

# Communications
brew install --cask wechat
brew install --cask qq
brew install --cask tencent-meeting
brew install --cask lark
brew install --cask telegram
brew install --cask whatsapp
brew install --cask line

# Office, Notes & Research
brew install --cask microsoft-office # Includes Word, Excel, PowerPoint, Outlook, OneNote
brew install --cask onedrive
brew install --cask notion
brew install --cask obsidian
brew install --cask zotero
brew install --cask grammarly-desktop
brew install --cask baidunetdisk

# Browsers, Media & Utilities
brew install --cask microsoft-edge
brew install --cask neteasemusic
brew install --cask vlc
brew install --cask jianying-pro
brew install --cask chatgpt
brew install --cask cheatsheet
brew install --cask clash-verge-rev
brew install --cask freedownloadmanager
brew install --cask ice

# git
git config --global user.email "yvon-shong@foxmail.com"
git config --global user.name "Yvon"

# zsh
if [ -n "$password" ]; then
    echo "$password" | sudo -S chsh -s /bin/zsh "$USER"
else
    chsh -s /bin/zsh
fi

mkdir -p ~/.oh-my-zsh
mkdir -p ~/.config
cp -R oh-my-zsh/* ~/.oh-my-zsh/
cp oh-my-zsh/.zshrc ~/

# iTerm2 Color Scheme
echo "Downloading and applying Dracula color scheme for iTerm2..."
curl -sSLo Dracula.itermcolors https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors
open Dracula.itermcolors

# flake8
cp file/flake8 ~/.config/flake8

# vim
mkdir -p ~/.vim_runtime
cp -R vim/* ~/.vim_runtime/
sh ~/.vim_runtime/install_awesome_vimrc.sh
