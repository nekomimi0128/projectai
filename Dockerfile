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
        locales \
        fonts-noto-cjk \
        firefox-esr \
    && apt-get clean

# 日本語ロケールの生成と環境変数設定
RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

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
