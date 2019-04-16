#!/bin/bash

REAL_NAME="$(dscl . read /Users/`whoami` RealName | grep -v RealName | awk '{print $1, $2}')"
EMAIL=$(python -c "print('{}@rewardstyle.com'.format('.'.join('$REAL_NAME'.split(' ')).lower()))")

DIR=$(mktemp -d)
if [ ! -d "${DIR}" ]; then
    mkdir "${DIR}"
fi
chmod 700 "${DIR}"

export GNUPGHOME="$DIR"

gpg --batch --gen-key <(cat <<EOF
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 2048
Name-Real: ${REAL_NAME}
Name-Email: ${EMAIL}
Expire-Date: 0
%no-protection
EOF
)

echo "check out ${DIR}, mang!"
echo "SOMEDIR=${DIR}"
