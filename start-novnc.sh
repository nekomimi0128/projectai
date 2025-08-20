#!/bin/bash
# 既存のセッションがあれば削除
vncserver -kill :1 2>/dev/null || true

# VNC 起動
vncserver :1 -geometry 1280x720 -depth 24

# noVNC 起動
/opt/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080
