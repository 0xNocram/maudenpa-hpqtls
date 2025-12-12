#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../src/HPQTLS/HPQTLS-VariadicSymbol.maude"

red summary(100,0) .

red summary(100,1) .

red summary(100,2) .

red summary(100,3) .

red summary(100,4) .

red summary(100,5) .

red summary(100,6) .

red summary(100,7) .
red initials(100,7) .

red summary(100,8) .
red initials(100,8) .

red summary(100,9) .
red initials(100,9) .

red summary(100,10) .
red initials(100,10) .

red summary(100,11) .
red initials(100,11) .

red summary(100,12) .
red initials(100,12) .

red summary(100,13) .
red initials(100,13) .

red summary(100,14) .
red initials(100,14) .
red run(100,14) .

red summary(100,15) .
red initials(100,15) .
red run(100,15) .

red summary(100,16) .
red initials(100,16) .

red summary(100,17) .
red initials(100,17) .

EOF
date
