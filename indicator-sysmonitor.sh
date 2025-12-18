sudo apt install -y python3-psutil gir1.2-appindicator3-0.1
git clone https://github.com/fossfreedom/indicator-sysmonitor.git
cd indicator-sysmonitor
sudo make install
cd ..
rm -rf indicator-sysmonitor
nohup indicator-sysmonitor &