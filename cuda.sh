# cuda

sudo sh cuda_12.8.1_570.124.06_linux.run

echo "export PATH=$PATH:/usr/local/cuda/bin" >> ~/.zshrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64" >> ~/.zshrc
echo "export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib64" >> ~/.zshrc


# cudnn
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cudnn

sudo apt-get -y install cudnn-cuda-12


