#!/bin/sh

date
echo

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../../test/maude-npa/Gather.maude"

red summary(2,0) .

red summary(2,1) .

red summary(2,2) .

red summary(2,3) .

red summary(2,4) .

red summary(2,5) .

red summary(2,6) .
red initials(2,6) .

red summary(2,7) .

red summary(2,8) .

red summary(2,9) .

EOF
date
