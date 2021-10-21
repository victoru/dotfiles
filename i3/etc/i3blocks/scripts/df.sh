#/bin/bash

#home=awk '/\/home$/ { print $4 }' <(df -h)
#tmpfs=awk '/\/tmp$/ { print $4 }' <(df -h)

df -h | awk -v pattern=$1 '$0 ~ pattern { print $4 }'
