# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: alpine
# Minimum Panel Version: 0.6.0
# ----------------------------------
# Container image that runs your code
FROM alpine:3.10

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["chmod +x entrypoint.sh"]
CMD ["/bin/bash", "/entrypoint.sh"]