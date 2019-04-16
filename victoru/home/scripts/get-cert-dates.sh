#!/bin/sh


if [ -z "$1" ]; then
	echo no
	exit 2
fi

HOST=${1}
PORT=${2:-443}

openssl s_client  -connect "${HOST}:${PORT}" 2>/dev/null | openssl x509 -noout -dates
