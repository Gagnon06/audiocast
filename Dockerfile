FROM rust:buster

ENV DEBIAN_FRONTEND=noninteractive

# Install requirements
RUN apt -y update && apt -y upgrade
RUN apt -y install \
    python3 \
    python3-pip \
    wget \
    nano \
    psmisc\
    build-essential \
    libasound2-dev

# Install librespot
RUN cargo install librespot

# Setup mopidy apt repo
RUN wget -O - https://apt.mopidy.com/mopidy.gpg | apt-key add -
RUN wget -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/buster.list

# Update and install mopidy packages
RUN apt -y update
RUN apt -y install \
    mopidy \
    mopidy-mpd \
    mopidy-spotify
RUN python3 -m pip install Mopidy-MusicBox-Webclient

# Download and install snapserver
RUN wget -O /tmp/snapserver.deb https://github.com/badaix/snapcast/releases/download/v0.26.0/snapserver_0.26.0-1_amd64.deb && \
    apt -y install /tmp/snapserver.deb && \
    rm /tmp/snapserver.deb

# Generate config files
RUN /usr/bin/snapserver & \
    sleep 1 && \
    killall snapserver

VOLUME /root/.config

COPY start.sh start.sh
CMD ./start.sh