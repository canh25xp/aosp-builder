FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV USE_CCACHE=1
ENV CCACHE_DIR=/ccache
ENV CCACHE_EXEC=/usr/bin/ccache

# https://source.android.com/docs/setup/start/requirements#install-packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    git-core \
    gnupg \
    flex \
    bison \
    build-essential \
    zip \
    curl \
    zlib1g-dev \
    libc6-dev-i386 \
    x11proto-core-dev \
    libx11-dev \
    lib32z1-dev \
    libgl1-mesa-dev \
    libxml2-utils \
    xsltproc \
    unzip \
    fontconfig \
    rsync \
    openssl \
    ccache \
    && apt-get clean

WORKDIR /aosp

COPY entrypoint.sh /usr/local/bin/aosp-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/aosp-entrypoint.sh"]
