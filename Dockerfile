FROM alpine:3.8

RUN apk -U upgrade && \
    apk add --no-cache nsd inotify-tools tini openssl && \
    rm -rf /var/cache/apk/*

COPY scripts/docker-entrypoint.sh /usr/bin/docker-entrypoint
COPY scripts/watch-nsd-config.sh /usr/bin/watch-nsd-config
COPY scripts/watch-zonefiles.sh /usr/bin/watch-zonefiles

RUN chmod +x /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/watch-nsd-config
RUN chmod +x /usr/bin/watch-zonefiles

RUN mkdir -p /home/nsd/
RUN chown -c nsd /home/nsd

USER nsd

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "/usr/bin/docker-entrypoint"]
