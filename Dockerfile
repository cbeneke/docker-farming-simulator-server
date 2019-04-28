FROM ubuntu:bionic

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        gnupg \
    && echo 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' > /etc/apt/sources.list.d/wine.list \
    && curl -fsSL https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        haproxy \
        openssh-server \
        supervisor \
        winbind \
        winehq-stable \
        winetricks \
        xvfb \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config \
    && mkdir /run/sshd \
    && useradd -ms /bin/bash farmer \
    && mkdir /app \
    && chown farmer:farmer /app

USER farmer
ENV WINEPREFIX=/app
RUN winecfg \
    && winetricks dlls dotnet462 \
    && winetricks settings win10
USER root

COPY files/supervisord.conf /etc/supervisor/supervisord.conf
COPY files/haproxy.cfg /etc/haproxy/haproxy.cfg
COPY files/run-farming-simulator.sh /usr/local/bin/run-farming-simulator

RUN chmod +x /usr/local/bin/run-farming-simulator

EXPOSE 80
CMD ["/usr/bin/supervisord"]
