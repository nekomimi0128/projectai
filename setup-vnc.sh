#!/bin/bash

# VNC パスワード設定（初回のみ手入力）
vncserver :1

# VNC サーバー停止（自動起動用に）
vncserver -kill :1

# VNC サーバー自動起動用の設定
echo "#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
" > ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup

# VNC ポート
echo "VNC 初期設定完了！ポート: 5901"
