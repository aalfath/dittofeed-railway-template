# Changelog

## 2026-11-17: first release

- Deploy on Railway button in the README (template `dittofeed-3`).
- Dittofeed lite `v0.23.0` (`dittofeed/dittofeed-lite@sha256:f8e55e9469892434b8e9afe2953d023da70772df67dd98ae742f4f07f9ea6617`).
- Temporal server `1.32.2` with its schema created and migrated in Railway Postgres on start.
- ClickHouse `24.12.6.70-alpine` (the version Dittofeed's own compose file uses), console logging, 7-day TTL on query and part logs.
