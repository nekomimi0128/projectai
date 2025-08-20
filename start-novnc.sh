#!/bin/bash

# VNC パスワード（8文字以内）
VNCPASS="nekomimi"

# VNC サーバー起動
mkdir -p $HOME/.vnc
echo $VNCPASS | vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd

# 古い VNC プロセスを停止
vncserver -kill :1 >/dev/null 2>&1 || true

# VNC サーバー起動（解像度 1280x720, ディスプレイ :1）
vncserver :1 -geometry 1280x720 -depth 24

# noVNC 起動（Web から操作可能）
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901 --listen 6080
