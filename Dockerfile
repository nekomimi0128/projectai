# Kali Linux 最新イメージ
FROM kalilinux/kali-rolling:latest

# 必要パッケージのインストール
RUN apt-get update && \
    apt-get install -y \
        xfce4 xfce4-goodies \
        tightvncserver \
        novnc \
        websockify \
        dbus-x11 x11-xserver-utils \
        sudo \
    && apt-get clean

# VNC 用設定ディレクトリ作成
RUN mkdir -p /root/.vnc

# xstartup をコピー & 実行権限付与
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# start-novnc.sh をコピー & 実行権限付与
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# 6080 ポートを開放
EXPOSE 6080

# コンテナ起動時にスクリプトを実行
CMD ["/root/start-novnc.sh"]
