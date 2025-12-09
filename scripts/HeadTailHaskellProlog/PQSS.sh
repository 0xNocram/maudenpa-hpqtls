#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../maude-npa.maude"
load "${SCRIPT_DIR}/../../src/HeadTailHaskellProlog.maude"

red summary(2,0) .

red summary(2,1) .

red summary(2,2) .

red summary(2,3) .

red summary(2,4) .

red summary(2,5) .

red summary(2,6) .

red summary(2,7) .

EOF
date
