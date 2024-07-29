# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: alpine
# Minimum Panel Version: 0.6.0
# ----------------------------------
# Container image that runs your code
FROM --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>
ENV         DEBIAN_FRONTEND=noninteractive

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

RUN			dpkg --add-architecture i386 \
			&& apt update \
			&& apt upgrade -y \
			&& apt install -y lib32gcc-s1 lib32stdc++6 unzip curl iproute2 tzdata libgdiplus libsdl2-2.0-0:i386 \
			&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
			&& apt install -y nodejs \
			&& mkdir /node_modules \
			&& npm install --prefix / ws \
			&& useradd -d /home/container -m container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["chmod +x entrypoint.sh"]
CMD ["/bin/bash", "/entrypoint.sh"]