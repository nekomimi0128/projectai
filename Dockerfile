# ベースイメージ
FROM kalilinux/kali-rolling

# 必要パッケージインストール
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    x11vnc \
    novnc \
    websockify \
    wget \
    net-tools \
    sudo \
    curl \
    git \
    && apt-get clean

# VNCパスワード設定（必要なら）
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# スクリプトをコピー（ホスト側に start-novnc.sh 作成）
COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

# 作業ディレクトリ
WORKDIR /root

# ポート解放
EXPOSE 6080

# デフォルトコマンド
CMD ["/root/start-novnc.sh"]
