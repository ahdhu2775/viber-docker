FROM lscr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# Install dependencies + Viber
RUN apt-get update && \
    apt-get install -y wget libnotify4 libnss3 libxss1 libasound2 libappindicator3-1 libxtst6 libgstreamer1.0-0 libgstreamer-plugins-base1.0-0 && \
    wget -O /tmp/viber.deb "https://download.cdn.viber.com/cdn/desktop/Linux/viber.deb" && \
    apt install -y /tmp/viber.deb && \
    rm /tmp/viber.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Autostart Viber in the desktop session
RUN mkdir -p /defaults && \
    printf '#!/bin/bash\nviber &\n' > /defaults/autostart && \
    chmod +x /defaults/autostart

ENV TITLE=Viber

EXPOSE 3000
