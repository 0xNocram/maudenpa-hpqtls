#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../maude-npa.maude"
load "${SCRIPT_DIR}/../../src/VariadicSymbol.maude"

red summary(0,0) .

red summary(0,1) .

red summary(0,2) .

red summary(0,3) .

red summary(0,4) .

red summary(0,5) .

red summary(0,6) .

red summary(0,7) .

red summary(0,8) .

red summary(0,9) .

red summary(0,10) .

red summary(0,11) .

red summary(0,12) .

red summary(0,13) .

red summary(0,14) .

red summary(0,15) .

red summary(0,16) .

red summary(0,17) .

red summary(0,18) .

red summary(0,19) .

red summary(0,20) .

red summary(0,21) .

EOF
date
