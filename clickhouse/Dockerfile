# ClickHouse for Dittofeed on Railway: the version Dittofeed's own compose file
# uses, pinned by version and digest, plus a small start script and config.
FROM clickhouse/clickhouse-server:24.12.6.70-alpine@sha256:cd450891db46cc6ffe313ca2b0fb7dbfb897a6873ca74a724cbe050a2cf62621

COPY config.d/railway.xml /etc/clickhouse-server/config.d/railway.xml
COPY --chmod=0755 railway-entrypoint.sh /usr/local/bin/railway-entrypoint.sh

# HTTP interface (Dittofeed talks to it over Railway's private network)
EXPOSE 8123
ENTRYPOINT ["/usr/local/bin/railway-entrypoint.sh"]
