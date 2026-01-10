#!/bin/bash

echo "Initializing VPN setup script..."

echo "enter vpn server:"
read vpnserver

echo "enter vpn user:"
read vpnuser

echo "enter vpn password:"
read -s vpnpass

echo "enter id:"
read -s vpnid

echo "enter secret:"
read -s vpnsecret

sudo apt update -y
sudo apt install -y network-manager-vpnc

cat <<EOF | sudo tee /usr/local/bin/vpnlogin
#!/bin/bash
sudo vpnc --username $vpnuser --password $vpnpass --gateway $vpnserver --local-port 0 --id $vpnid --secret $vpnsecret
EOF

sudo chmod +x /usr/local/bin/vpnlogin