password=$1
echo $password | sudo -S apt install -y libpcl-dev libeigen3-dev libgoogle-glog-dev

# download
# pybind