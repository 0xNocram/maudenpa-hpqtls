#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../src/HPQTLS/HPQTLS-VariadicSymbol.maude"

red summary(2,0) .

red summary(2,1) .

red summary(2,2) .

red summary(2,3) .

red summary(2,4) .

red summary(2,5) .

red summary(2,6) .

red summary(2,7) .

red summary(2,8) .

red summary(2,9) .

red summary(2,10) .

red summary(2,11) .

red summary(2,12) .

red summary(2,13) .

red summary(2,14) .

red summary(2,15) .

red summary(2,16) .

red summary(2,17) .

EOF
date
