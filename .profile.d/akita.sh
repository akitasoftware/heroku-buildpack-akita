#!/usr/bin/env bash

# Populated by bin/compile
PATH_UPDATE_HERE

if [ -z "${AKITA_API_KEY_ID}" ]; then
  echo "AKITA_API_KEY_ID environment variable not set"
  exit 1
fi

if [ -z "${AKITA_API_KEY_SECRET}" ]; then
  echo "AKITA_API_KEY_SECRET environment variable not set"
  exit 1
fi

if [ -z "${AKITA_SERVICE}" ]; then
  echo "AKITA_SERVICE environment variable not set"
  exit 1
fi

if [ -z "${HEROKU_SLUG_COMMIT}" ]; then
  echo "Heroku Labs Dyno Metadata not enabled"
  exit 1
fi

# PATH set by compile script
if [ -z "${PORT}" ]; then
  akita apidump \
    --out akita://${AKITA_SERVICE}:trace:heroku-${HEROKU_SLUG_COMMIT}
else
  akita apidump \
    --out akita://${AKITA_SERVICE}:trace:heroku-${HEROKU_SLUG_COMMIT} \
    --filter "port ${PORT}"
fi
