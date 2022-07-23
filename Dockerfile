FROM anasty17/mltb:heroku

RUN mkdir ./app
RUN chmod 777 ./app
WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata
RUN rm -r /var/lib/apt/lists/*
RUN apt upgrade
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

RUN mkdir /app/gautam
RUN wget -O /app/gautam/gclone.gz https://git.io/JJMSG
RUN gzip -d /app/gautam/gclone.gz
RUN chmod 0775 /app/gautam/gclone

RUN pip install -U pip
