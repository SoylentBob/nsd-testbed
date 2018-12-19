FROM alpine:3.8

RUN apk add --no-cache nsd inotify-tools tini openssl

COPY scripts/docker-entrypoint /usr/bin/docker-entrypoint
COPY scripts/watch-nsd-config /usr/bin/watch-nsd-config
COPY scripts/watch-zonefiles /usr/bin/watch-zonefiles

RUN chmod +x /usr/bin/docker-entrypoint
RUN chmod +x /usr/bin/watch-nsd-config
RUN chmod +x /usr/bin/watch-zonefiles

RUN adduser -S dns

# TODO: NSD should be run as a non root user
#USER dns

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["sh", "/usr/bin/docker-entrypoint"]
