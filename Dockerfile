# Kali Linux 公式イメージ
FROM kalilinux/kali-rolling:latest

# 基本パッケージ更新 & GUI + VNC + noVNC をインストール
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    novnc websockify \
    sudo wget curl git vim \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# root の VNC 設定用ディレクトリ作成
RUN mkdir -p /root/.vnc

# xstartup をコピー & 実行権限付与
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# noVNC 用スクリプトをコピー & 実行権限付与
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# 作業ディレクトリ
WORKDIR /root

# デフォルトコマンド（VNC / noVNC 起動）
CMD ["./start-novnc.sh"]
