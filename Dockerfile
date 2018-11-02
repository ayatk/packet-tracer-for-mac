FROM debian:9

RUN apt update \
    && apt dist-upgrade -y \
    && apt install -y \
    libqt5webkit5 \
    libqt5multimedia5 \
    libqt5script5 \
    libqt5xml5 \
    libqt5scripttools5 \
    libqt5sql5 \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    dbus \
    dbus-x11 \
    xorg \
    xserver-xorg-legacy \
    xserver-xorg-video-intel \
    xserver-xorg-core \
    xinit \
    && apt clean all

ADD http://security.debian.org/debian-security/pool/updates/main/o/openssl/libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb /tmp
RUN dpkg -i /tmp/libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb && rm -rf /tmp/libssl1.0.0_1.0.1t-1+deb7u4_amd64.deb
ENV PT_FILENAME="Packet Tracer 7.2 for Linux 64 bit.tar.gz"
ADD $PT_FILENAME /opt/pt
ENV DISPLAY=:0

CMD LD_LIBRARY_PATH=/opt/pt/lib PT7HOME=/opt/pt /opt/pt/bin/PacketTracer7 
