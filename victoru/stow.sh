#!/bin/bash

DIR=$(dirname $0)
PACKAGES=$(find $DIR -mindepth 1 -maxdepth 1 -type d | awk -F/ '{print $2}')
for package in $PACKAGES; do
	stow --dir=${DIR} --target=${HOME} ${package}
done
