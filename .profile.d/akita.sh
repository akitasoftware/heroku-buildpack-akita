#!/usr/bin/env bash

export PATH=${PATH}:${HOME}/akita/bin

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

echo "HOME AKITA DIR"
ls -l ${HOME}/akita
ls -l ${HOME}/akita/bin

echo "PWD"
pwd

echo "LS PWD"
ls $(pwd)

echo "LS /"
ls /

echo "========="

if [ -z "${PORT}" ]; then
  ${HOME}/akita/bin/akita apidump \
    --out akita://${AKITA_SERVICE}:trace:heroku-${HEROKU_SLUG_COMMIT}
else
  ${HOME}/akita/bin/akita apidump \
    --out akita://${AKITA_SERVICE}:trace:heroku-${HEROKU_SLUG_COMMIT} \
    --filter "port ${PORT}"
fi
