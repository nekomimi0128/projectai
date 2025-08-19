#!/bin/bash

# VNC サーバー起動
vncserver :1 -geometry 1280x720 -depth 24

# noVNC 起動（ブラウザで表示）
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080
