# Kali Linux ベース
FROM kalilinux/kali-rolling

# 必要パッケージインストール
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    tightvncserver \
    firefox \
    nmap \
    metasploit-framework \
    git \
    curl \
    sudo \
    dbus-x11 \
    x11-xserver-utils

# VNC 初期設定用スクリプトコピー
COPY setup-vnc.sh /root/setup-vnc.sh
RUN chmod +x /root/setup-vnc.sh
