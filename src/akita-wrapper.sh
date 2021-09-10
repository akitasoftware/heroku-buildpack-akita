#!/usr/bin/env bash

if [ -z "$AKITA_API_KEY_ID" ]; then
    echo "ERROR: Akita daemon not started: AKITA_API_KEY_ID not set."
    return 1
fi

if [ -z "$AKITA_API_KEY_SECRET" ]; then
    echo "ERROR: Akita daemon not started: AKITA_API_KEY_SECRET not set."
    return 1
fi

AKITA_DAEMON_PORT=${AKITA_DAEMON_PORT:-58000}
AKITA_DAEMON_NAME=${AKITA_DAEMON_NAME:-heroku}-${DYNO}

while true; do
    echo "Starting Akita in daemon mode on port ${AKITA_DAEMON_PORT}."
    /app/bin/akita daemon --port ${AKITA_DAEMON_PORT} --name ${AKITA_DAEMON_NAME} ${AKITA_DAEMON_ARGS}
    echo "ERROR: Akita daemon exited; restarting in 60 seconds."
    sleep 60
done
