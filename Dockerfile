# Kali ベース
FROM kalilinux/kali-rolling

# パッケージ更新と必要なものインストール
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies tightvncserver novnc websockify sudo && \
    apt-get clean

# .vnc ディレクトリ作成
RUN mkdir -p /root/.vnc

# xstartup をコピーして実行権限付与
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# start-novnc.sh をコピーして実行権限付与
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# コンテナ起動時に VNC + noVNC を立ち上げる
CMD ["/root/start-novnc.sh"]
