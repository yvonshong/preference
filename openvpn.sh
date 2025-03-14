# https://openvpn.net/cloud-docs/tutorials/configuration-tutorials/connectors/operating-systems/linux/tutorial--learn-to-install-and-control-the-openvpn-3-client.html#ftn.UUID-956a4068-639d-608a-e9ef-bfabcb339cea_footnote-idm113454593171514
sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://packages.openvpn.net/packages-repo.gpg | sudo tee /etc/apt/keyrings/openvpn.asc
DISTRO=$(lsb_release -c -s)
echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $DISTRO main" | sudo tee /etc/apt/sources.list.d/openvpn-packages.list
sudo apt update
sudo apt install -y openvpn3

mkdir -p ~/openvpn
mv ~/Downloads/*.ovpn ~/openvpn

cat << 'EOF' > ~/openvpn/openvpn_start.sh
#!/bin/bash
openvpn3 config-import --config ~/openvpn/*.ovpn
openvpn3 session-start --config ~/openvpn/*.ovpn
EOF