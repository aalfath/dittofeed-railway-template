# Dittofeed (lite: API, dashboard and worker in one process) for Railway.
# The official image, pinned by version and digest. Bump the pin here to ship an update.
FROM dittofeed/dittofeed-lite:v0.23.0@sha256:f8e55e9469892434b8e9afe2953d023da70772df67dd98ae742f4f07f9ea6617

COPY --chmod=0755 railway-start.sh /usr/local/bin/railway-start.sh

EXPOSE 3000
CMD ["/usr/local/bin/railway-start.sh"]
