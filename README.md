## TAHAP 1
```
apt-get update && apt-get upgrade -y && apt-get install lolcat -y && apt-get install figlet -y && gem install lolcat && update-grub && sleep 2 && reboot
```
TAHAP 2
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update &&  apt install lolcat -y && gem install lolcat && apt install figlet -y && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/geovpn/scvps/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
