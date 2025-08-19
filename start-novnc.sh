#!/bin/bash

# VNC パスワード設定（好きなパスワードを入れてね）
VNC_PASS="nekomimi"

# VNC サーバー起動（1ディスプレイ、指定パスワード）
mkdir -p /root/.vnc
echo $VNC_PASS | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
vncserver :1 -geometry 1280x720 -depth 24 -rfbauth /root/.vnc/passwd

# noVNC 起動
/opt/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080 &

echo "アクセスURL: http://localhost:6080/vnc.html?host=localhost&port=6080"
echo "VNC パスワード: $VNC_PASS"
wait
