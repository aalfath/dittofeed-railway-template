#!/bin/sh
# Railway start script: sensible defaults, a check that the secrets are set,
# then the same start command as the official image.
set -eu

export NODE_ENV="${NODE_ENV:-production}"
export AUTH_MODE="${AUTH_MODE:-single-tenant}"
export WORKSPACE_NAME="${WORKSPACE_NAME:-Default}"
# Bootstrap is idempotent: it runs the Postgres migrations, creates the
# ClickHouse tables and makes sure the workspace exists. Set BOOTSTRAP=false
# to skip it (Dittofeed's docs suggest that while running a manual upgrade).
export BOOTSTRAP="${BOOTSTRAP:-true}"
export SESSION_COOKIE_SECURE="${SESSION_COOKIE_SECURE:-true}"
HEAP_MB="${LITE_MEM_LIMIT:-1024}"

if [ "$AUTH_MODE" = "single-tenant" ]; then
  [ -n "${PASSWORD:-}" ] || { echo "railway-start: PASSWORD is empty; set it so the dashboard is not open with the built-in default." >&2; exit 1; }
  [ -n "${SECRET_KEY:-}" ] || { echo "railway-start: SECRET_KEY is empty; set a base64 value of 32 bytes." >&2; exit 1; }
fi

exec node --max-old-space-size="$HEAP_MB" ./packages/lite/dist/scripts/startLite.js --workspace-name="$WORKSPACE_NAME"
