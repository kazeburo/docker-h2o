#!/bin/bash
set -e
: ${H2O_PORT:='80 443'}
if [ -z "$H2O_PORT" ]; then
    echo >&2 "error: missing required H2O_PORT environment variable"
    exit 1
fi

ports=()
for v in  $H2O_PORT; do
    ports=(${ports[@]} "--port")
    ports=(${ports[@]} "$v")
done

exec start_server ${ports[@]} -- /h2o/h2o -c $@
