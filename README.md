[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/dittofeed-3?utm_medium=integration&utm_source=button&utm_campaign=dittofeed)

# Dittofeed on Railway

This repo is the source of the **Dittofeed** template on Railway. [Dittofeed](https://github.com/dittofeed/dittofeed) is an open-source (MIT) customer engagement platform: send transactional and marketing messages by email, SMS, mobile push, WhatsApp, Slack and webhooks, driven by user segments and journeys.

## What the template deploys

| Service | Source | What it does |
|---|---|---|
| `Dittofeed` | [`dittofeed/`](dittofeed/): `dittofeed/dittofeed-lite:v0.23.0` pinned by digest | Dashboard, API and worker in one process. Public domain, health check `/api`. |
| `Temporal` | [`temporal/`](temporal/): `temporalio/server:1.32.2` pinned by digest | Workflow engine for journeys and bootstrap. Creates and migrates its own schema in Postgres on start and registers the `default` namespace. Private network only. |
| `ClickHouse` | [`clickhouse/`](clickhouse/): `clickhouse/clickhouse-server:24.12.6.70-alpine` pinned by digest | Event and analytics store, on a volume. Logs to the console; heavy system log tables are off. Private network only. |
| `Postgres` | Railway's Postgres | App data and Temporal's two databases, on a volume. |

## Variables

All variables are filled in by the template; there is nothing to type.

- `PASSWORD` (Dittofeed): the dashboard login password, generated. Read it in the service's Variables tab.
- `SECRET_KEY` (Dittofeed): a generated base64 key of exactly 32 bytes that encrypts sessions and stored secrets. Don't change it after first use.
- `DASHBOARD_URL`, `DASHBOARD_API_BASE`: your Railway domain, used for links and the API base. Change both if you add a custom domain.
- Database, ClickHouse and Temporal connection settings are reference variables over Railway's private network.

Optional, set them yourself if you need them: `BOOTSTRAP=false` (skip the start-up bootstrap; it is idempotent and on by default), `LITE_MEM_LIMIT` (Node heap in MB, default 1024), `WORKSPACE_NAME` (default `Default`), and blob storage (`ENABLE_BLOB_STORAGE`, `BLOB_STORAGE_*`) for file attachments. Email, SMS and push providers are set up inside the dashboard under Settings.

## Updates

Every service except Postgres builds from this repo. When we bump a pinned version here, Railway shows deployers an "update available" notice; read [CHANGELOG.md](CHANGELOG.md) first, then apply it from your project. Dittofeed releases sometimes need its admin CLI for migrations; the changelog says when.

## Local test

`compose.yaml` runs the same four services locally (not used by Railway):

```sh
PGPASS=... CHPASS=... APPPASS=... SECRET_KEY=$(openssl rand -base64 32) docker compose up --build
```

Then open http://localhost:42496 and sign in with `APPPASS`.

## Licence

The wrapper files in this repo are MIT. Dittofeed, Temporal and ClickHouse keep their own licences.
