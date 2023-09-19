#!bin/bash

dpkg --add-architecture i386; apt update; 
apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 distro-info firewalld nodejs

adduser sfserver
su - sfserver

wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh sfserver

./sfserver install

firewall-cmd --add-port=7777/udp --permanent && firewall-cmd --add-port=15777/udp --permanent && firewall-cmd --add-port=15000/udp --permanent
firewall-cmd --reload
firewall-cmd --list-all

echo '
branch="public"
' >> /home/sfserver/lgsm/config-lgsm/sfserver/common.cfg

echo '
[/Script/Engine.GameSession]
MaxPlayers="8" # 1-8
' >> /home/sfserver/serverfiles/FactoryGame/Saved/Config/LinuxServer/Game.ini

./sfserver restart

./sfserver details
