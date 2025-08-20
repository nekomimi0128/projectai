#!/bin/bash

# VNCサーバー起動
vncserver :1 -geometry 1280x720 -depth 24

# noVNC 起動
/usr/share/novnc/utils/novnc_proxy --vnc localhost:5901
