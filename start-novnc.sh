#!/bin/bash

# USER 環境変数を設定
export USER=root

# VNC サーバー起動（パスワード設定済み）
vncserver :1 -geometry 1280x720 -depth 24

# noVNC 起動
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080

echo "アクセスURL: http://localhost:6080/vnc.html?host=localhost&port=6080"
