FROM alpine:latest

RUN apk update && \
    apk add --no-cache redis && \
    mkdir -p /data

COPY redis.conf /etc/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]