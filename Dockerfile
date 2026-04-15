FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddyserver/forwardproxy \
    #--with github.com/caddy-dns/dnspod \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/replace-response \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/mholt/caddy-webdav


FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
