FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddyserver/forwardproxy@caddy2 \
    --with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/sjtug/caddy2-filter \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/mholt/caddy-webdav


FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
