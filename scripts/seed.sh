#!/usr/bin/env bash
# Load 30 days of history so the charts are not empty.
set -euo pipefail
cd "$(dirname "$0")/.."
: "${DATABASE_URL:=postgresql+psycopg://hawa:hawa@localhost:5432/safahawa}"
export DATABASE_URL
(cd api && python -m alembic upgrade head)
(cd poller && python -m poller.run --backfill-days 30)
