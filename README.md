# Satisfactory Game Server

![Satisfactory](https://img.shields.io/badge/Satisfactory-000000)
![Game](https://img.shields.io/badge/Game-000000)
![Server](https://img.shields.io/badge/Server-000000)
![LinuxGSM](https://img.shields.io/badge/LinuxGSM-000000)
![Debian](https://img.shields.io/badge/Debian-000000)

---


Satisfactory Game Server. Based on a Debian 11 distro, install and configure linuxGSM in order to run Satisfactory instance

## 🚀 Ready to use

Use the script to automatically install and configure the server

```sh
bash init.sh
```

## 📚 Documentation

### Install dependencies

```sh
dpkg --add-architecture i386; apt update; apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 distro-info firewalld nodejs
```

### Create user

```sh
adduser sfserver
su - sfserver
```

### Install LinuxGSM

```sh
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh sfserver
```

### Start game installation

```sh
./sfserver install
```

### Configure port forwarding

```sh
firewall-cmd --add-port=7777/udp --permanent && firewall-cmd --add-port=15777/udp --permanent && firewall-cmd --add-port=15000/udp --permanent
firewall-cmd --reload
firewall-cmd --list-all
```

### Start game server

```sh
./sfserver start
```