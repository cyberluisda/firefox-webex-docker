FROM ubuntu:16.04

LABEL maintainer="Luis David Barrios <cyberluisda@gmail.com>"

# Install firefox, libraries and java of 32 bits
RUN dpkg --add-architecture i386 \
  && apt-get update && apt-get install -y --no-install-recommends \
    libxtst6:i386 \
    libxrender1:i386 \
    openjdk-8-jdk-headless:i386 \
    icedtea-8-plugin:i386 \
    firefox:i386 \
    icedtea-netx:i386 \
    libxft2:i386 \
    libxmu6:i386 \
    libxv1:i386 \
    alsa-utils:i386 \
    libpulse0:i386 \
    xdg-utils:i386 \
  && rm -rf /var/lib/apt/lists/*

# --devtools is only for decrease probablity of broking page
CMD [ "firefox", "--devtools" ]
