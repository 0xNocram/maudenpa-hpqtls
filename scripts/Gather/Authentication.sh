#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../maude-npa.maude"
load "${SCRIPT_DIR}/../../src/Gather.maude"

red summary(0,0) .

red summary(0,1) .

red summary(0,2) .

red summary(0,3) .

red summary(0,4) .

red summary(0,5) .

red summary(0,6) .

red summary(0,7) .

EOF
date
