FROM kalilinux/kali-rolling:latest

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

RUN sed -i -e 's/# ja_JP.UTF-8 UTF-8/ja_JP.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

RUN mkdir -p /root/.vnc

COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

COPY start-novnc.sh /root/start-novnc.sh
RUN chmod +x /root/start-novnc.sh

EXPOSE 6080

CMD ["/root/start-novnc.sh"]
