#!/bin/bash
# Proxy For Edukasi Ssh & Ovpn Websocket
# ====================================

# Ovpn Websocket !!!
# =================================

# Getting Ovpn Ws Template
wget -q -O /usr/local/bin/wsovpn https://raw.githubusercontent.com/geovpn/scvps/main/wsovpn.py
chmod +x /usr/local/bin/wsovpn


# Installing Service Ovpn Websocket
cat > /etc/systemd/system/edu-ovpn.service << END
[Unit]
Description=Ovpn Websocket By GEO GABUT
Documentation=https://t.me/sampiiiiu
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/wsovpn 443
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable wsovpn
systemctl restart wsovpn

clear
echo -e "==============================="
echo -e "Script By GEO GABUT"
