#!/usr/bin/env bash
# Run the whole stack on your laptop, without containers.
#
# You need a Postgres reachable at DATABASE_URL before this will work.
# Getting one running is your first task -- see STUDENT-TASKS.md.

set -euo pipefail
cd "$(dirname "$0")/.."

: "${DATABASE_URL:=postgresql+psycopg://hawa:hawa@localhost:5432/safahawa}"
export DATABASE_URL

echo "==> Running migrations"
(cd api && python -m alembic upgrade head)

echo "==> Starting API on :8000"
(cd api && python -m uvicorn app.main:app --reload --port 8000) &
API_PID=$!

echo "==> Starting web on :5173"
(cd web && npm run dev) &
WEB_PID=$!

trap 'kill $API_PID $WEB_PID 2>/dev/null || true' EXIT
wait
