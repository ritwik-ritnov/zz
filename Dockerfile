FROM anasty17/mltb:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

RUN apt -qq update --fix-missing && \
    apt -qq install -y \
    git \
    aria2 \
    wget \
    curl \
    busybox \
    unzip \
    unrar \
    tar \
    python3 \
    ffmpeg \
    python3-pip \
    p7zip-full \
    p7zip-rar \
    pv \
    jq \
    python3-dev \
    mediainfo

RUN wget https://rclone.org/install.sh
RUN bash install.sh

RUN mkdir /usr/src/app/gautam
RUN wget -O /usr/src/app/gautam/gclone.gz https://git.io/JJMSG
RUN gzip -d /usr/src/app/gautam/gclone.gz
RUN chmod 0775 /usr/src/app/gautam/gclone

RUN pip install -U pip
