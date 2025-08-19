# ベースイメージ
FROM kalilinux/kali-rolling

# パッケージ更新 & XFCE / VNC / noVNC インストール
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies tightvncserver novnc websockify wget sudo curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# VNC ディレクトリ作成
RUN mkdir -p /root/.vnc

# xstartup コピー & 実行権限付与
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# noVNC 起動用スクリプトコピー & 実行権限
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# コンテナ起動時に bash
CMD ["/bin/bash"]
