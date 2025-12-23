#!/bin/sh

date
echo

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../../test/maude-npa/Gather.maude"

red summary(1,0) .

red summary(1,1) .

red summary(1,2) .
red initials(1,2) .

red summary(1,3) .

red summary(1,4) .

red summary(1,5) .

red summary(1,6) .

red summary(1,7) .

red summary(1,8) .

red summary(1,9) .

EOF
date
