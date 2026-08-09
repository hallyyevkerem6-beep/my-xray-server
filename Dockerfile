FROM alpine:latest

RUN apk add --no-cache ca-certificates caddy wget unzip

ENV PORT=10000
ENV UUID=de0b9bab-cc48-4a7a-a41b-da6e1f154152

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
