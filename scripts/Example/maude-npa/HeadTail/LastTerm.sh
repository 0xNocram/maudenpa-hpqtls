#!/bin/sh

date
echo

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../../test/maude-npa/HeadTail.maude"

red summary(3,0) .

red summary(3,1) .

red summary(3,2) .

red summary(3,3) .

red summary(3,4) .

red summary(3,5) .

red summary(3,6) .

red summary(3,7) .

red summary(3,8) .

red summary(3,9) .

red summary(3,10) .
red initials(3,10) .

EOF
date
