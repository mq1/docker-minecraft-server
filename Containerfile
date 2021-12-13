FROM alpine:3.15

LABEL org.opencontainers.image.authors="Manuel Quarneti <manuelquarneti@gmail.com>"

# Install packages
RUN apk add --no-cache openjdk17-jre-headless jq

# Remove apk
RUN rm -f /sbin/apk && \
    rm -rf /etc/apk && \
    rm -rf /lib/apk && \
    rm -rf /usr/share/apk && \
    rm -rf /var/lib/apk

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

ENV MEMORY=1G \
    TYPE=VANLLA \
    VERSION=LATEST

COPY scripts/ /scripts/
RUN chmod +x /scripts/*

USER 1000:1000
ENTRYPOINT ["/scripts/start.sh"]
