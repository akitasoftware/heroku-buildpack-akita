#!/usr/bin/env bash

if [ -z "${AKITA_API_KEY_ID}" ]; then
  echo "AKITA_API_KEY_ID environment variable not set"
  exit 0
fi

if [ -z "${AKITA_API_KEY_SECRET}" ]; then
  echo "AKITA_API_KEY_SECRET environment variable not set"
  exit 0
fi

if [ -z "${AKITA_SERVICE}" ]; then
  echo "AKITA_SERVICE environment variable not set"
  exit 0
fi

if [ -z "${PORT}" ]; then
  akita learn --service ${AKITA_SERVICE}
else
  akita learn --service ${AKITA_SERVICE} --filter "port ${PORT}"
fi

