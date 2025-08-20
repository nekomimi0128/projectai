FROM kalilinux/kali-rolling:latest

# 基本パッケージとGUI, VNC, noVNC, 日本語フォントなどをインストール
RUN apt-get update && \
    apt-get install -y \
        xfce4 xfce4-goodies \
        tightvncserver \
        novnc \
        websockify \
        dbus-x11 x11-xserver-utils \
        sudo \
        locales \
        fonts-noto-cjk \
        firefox-esr \
    && apt-get clean

# 日本語ロケール設定
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# VNC用ディレクトリ
RUN mkdir -p /root/.vnc

# xstartup と start-novnc.sh をコピーして実行権限付与
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# noVNC用ポート
EXPOSE 6080

# 起動スクリプト
CMD ["/root/start-novnc.sh"]
