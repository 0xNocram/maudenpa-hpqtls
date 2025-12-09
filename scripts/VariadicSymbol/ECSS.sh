#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../maude-npa.maude"
load "${SCRIPT_DIR}/../../src/VariadicSymbol.maude"

red summary(1,0) .

red summary(1,1) .

red summary(1,2) .

red summary(1,3) .

red summary(1,4) .

red summary(1,5) .

red summary(1,6) .

red summary(1,7) .

red summary(1,8) .

red summary(1,9) .

red summary(1,10) .

red summary(1,11) .

red summary(1,12) .

red summary(1,13) .
red initials(1,13) .

red summary(1,14) .
red initials(1,14) .

red summary(1,15) .
red initials(1,15) .

red summary(1,16) .
red initials(1,16) .

red summary(1,17) .
red initials(1,17) .

red summary(1,18) .
red initials(1,18) .

red summary(1,19) .
red initials(1,19) .

EOF
date
