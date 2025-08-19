# 本物の Kali Rolling イメージをベースにする
FROM kalilinux/kali-rolling

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies tightvncserver novnc websockify sudo && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# デスクトップ環境の設定
RUN mkdir -p /root/.vnc
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# ポート設定
EXPOSE 5901 6080

# 起動スクリプトをコピー
COPY start-novnc.sh /start-novnc.sh
RUN chmod +x /start-novnc.sh

CMD ["/start-novnc.sh"]
