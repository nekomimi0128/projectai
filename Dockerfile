FROM kalilinux/kali-rolling:latest

# 必要なパッケージインストール
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies tightvncserver novnc websockify wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# VNC設定ディレクトリ作成
RUN mkdir -p /root/.vnc

# xstartup をコピー
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# noVNCスクリプトもコピー
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

WORKDIR /root
