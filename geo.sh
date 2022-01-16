#!/bin/bash
clear
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
bl='\e[36;1m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo -e ""
clear
echo -e "\e[1;32m
                           _---__
                        _-       /--______
                   __--( /     \ )XXXXXXXXXXX\v
                 .-XXX(   O   O  )XXXXXXXXXXXXXXX-
                /XXX(       U     )      $red  XXXXXXX $gl
              /XXXXX(              )--_ $red XXXXXXXXXXX $gl
             /XXXXX/ (      O     ) $red  XXXXXX $gl  \XXXXX
             XXXXX/   /        $red    XXXXXX $gl  \__ \XXXXX
            XXXXXX__/       $red   XXXXXX     $gl    \__---->
    ---___  XXX__/       $red   XXXXXX  $gl    \__         /
       \-  --__/   ___/\ $red XXXXXX    $gl        /  ___--/=
        \-\    ___/ $red   XXXXXX        $gl      '--- XXXXXX
       $red   \-\/XXX\ XXXXXX                  $gl    /XXXXX
           $red  \XXXXXXXXX $gl  \                    /XXXXX/
              \XXXXXX      >                 _/XXXXX/
                \XXXXX--__/              __-- XXXX/
                 -XXXXXXXX---------------  XXXXXX-
                    \XXXXXXXXXXXXXXXXXXXXXXXXXX/
                     ''VXXXXXXXXXXXXXXXXXXV''\e[0m"
echo -e ""
echo -e " $gl ======================================================== $off " 
echo -e "\e[1;33m     SELAMAT DATANG DI SISTEM SCRIPT PREMIUM GEO GABUT\e[0m" 
echo -e " $gl ======================================================== $off " 
echo -e ""
echo -e "      $bl ($gl 1$bl ). $bd Install Premium script All VPN"
echo -e ""
echo -e "      $bl ($gl x$bl ). $bd Batal Install"
echo -e ""
read -p "        Silahkan berikan jawaban anda : " jawab
echo -e ""
case $jawab in
1)
rm -f setup.sh && apt update && apt upgrade -y && apt install lolcat -y && gem install lolcat && apt install figlet -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/geovpn/scvps/main/setup.sh && chmod +x setup.sh && screen -S setup ./setup.sh
;;
x)
exit
;;
*)
echo "Masukkan Nomor Yang Ada Sayang!"
wget https://raw.githubusercontent.com/geovpn/scvps/main/geo.sh && chmod +x geo.sh && ./geo.sh
;;
esac
sleep 0.1
rm -f geo.sh