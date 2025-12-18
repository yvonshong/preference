# Preference
My personal work station config
# System Setting
```shell
sh config.sh {password}
```

# NVIDIA Driver and Cuda
- [cuda ubuntu 22.04 runfile_local](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=runfile_local)
- [cudnn](https://developer.nvidia.com/rdp/cudnn-download)

```shell
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
ubuntu-drivers devices 
sudo apt install nvidia-driver-570
```

# Web Browser
```shell
# egde
xdg-open https://www.microsoft.com/en-us/edge/download
# set it as defualt app
gnome-control-center default-applications
# set google as defualt search engine
xdg-open edge://settings/search
```

### Browser Plugin 
- [Violentmonkey](https://microsoftedge.microsoft.com/addons/detail/violentmonkey/eeagobfjdenkkddmbclomhiblgggliao)
    - [微信防撤回](https://greasyfork.org/zh-CN/scripts/374696-%E5%BE%AE%E4%BF%A1%E9%98%B2%E6%92%A4%E5%9B%9E)
    - [CSDN](https://greasyfork.org/zh-CN/scripts/378351-%E6%8C%81%E7%BB%AD%E6%9B%B4%E6%96%B0-csdn%E5%B9%BF%E5%91%8A%E5%AE%8C%E5%85%A8%E8%BF%87%E6%BB%A4-%E4%BA%BA%E6%80%A7%E5%8C%96%E8%84%9A%E6%9C%AC%E4%BC%98%E5%8C%96-%E4%B8%8D%E7%94%A8%E5%86%8D%E7%99%BB%E5%BD%95%E4%BA%86-%E8%AE%A9%E4%BD%A0%E4%BD%93%E9%AA%8C%E4%BB%A4%E4%BA%BA%E6%83%8A%E5%96%9C%E7%9A%84%E5%B4%AD%E6%96%B0csdn)
- [ublacklist](https://chrome.google.com/webstore/detail/ublacklist/pncfbmialoiaghdehhbnbhkkgmjanfhe)
    - [Subscription](https://raw.githubusercontent.com/scyrte/uBlacklist-Subscription/master/blacklist.txt)



# Download App
- [VS code](https://go.microsoft.com/fwlink/?LinkID=760868)
- [Feishu](https://www.feishu.cn/download)
- [Lark](https://www.larksuite.com/ja_jp/download)
- [baidu input](https://srf.baidu.com/site/guanwang_linux/index.html)
- [Obsidian](https://obsidian.md/download)
- [Clash](https://repo.trojan-cdn.com/clash_for_windows_pkg/LatestRelease/)
    - [shadowsocks](https://shadowsocks.nl/)



# Develop
## Anaconda

```shell
xdg-open https://www.anaconda.com/download/success

echo "export PATH=~/anaconda3/bin:$PATH" >> ~/.zshrc
echo "source ~/anaconda3/bin/activate" >> ~/.zshrc

echo "export PATH=~/anaconda3/bin:$PATH" >> ~/.bashrc
echo "source ~/anaconda3/bin/activate" >> ~/.bashrc

conda create -n py3.10 python=3.10

echo "conda activate py3.10" >> ~/.zshrc
echo "conda activate py3.10" >> ~/.bashrc
```

## Google Cloud CLI

- **Google Cloud CLI Installation**: [Install Google Cloud CLI](https://cloud.google.com/sdk/docs/install)
- **Google CLoud Artifact Registry Authentication**: [Authenticate with Google Cloud Artifact Registry](https://cloud.google.com/artifact-registry/docs/docker/authentication)


## rust

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.81.0
echo "source $HOME/.cargo/env" >> ~/.zshrc
```

# bugfix
```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 ~/anaconda3/lib/libstdc++.so.6
sudo ln -s ~/anaconda3/lib/libfmt.so.9 /usr/lib/libfmt.so.9
sudo ln -s ~/anaconda3/lib/libboost_filesystem.so.1.82.0 /usr/lib/libboost_filesystem.so.1.82.0
sudo ln -s ~/anaconda3/lib/libboost_iostreams.so.1.82.0 /usr/lib/libboost_iostreams.so.1.82.0
sudo ln -s ~/anaconda3/lib/libboost_atomic.so.1.82.0 /usr/lib/libboost_atomic.so.1.82.0


```
