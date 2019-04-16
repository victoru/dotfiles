#!/bin/sh


FOLDER_NAME="$1"
BRANCH_NAME="$2"

if [ -z "$BRANCH_NAME" -o -z "FOLDER_NAME" ]; then
    echo usage script.sh FOLDER_NAME BRANCH_NAME
    exit 1
fi

git filter-branch --prune-empty --subdirectory-filter "$FOLDER_NAME"  "$BRANCH_NAME"
