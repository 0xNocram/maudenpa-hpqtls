#!/bin/sh

ulimit -s 262144 2>/dev/null || ulimit -s unlimited 2>/dev/null || ulimit -s 131072

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../maude-npa.maude"
load "${SCRIPT_DIR}/../../src/Associativity.maude"

red summary(100,0) .

red summary(100,1) .

red summary(100,2) .

red summary(100,3) .

red summary(100,4) .

red summary(100,5) .

red summary(100,6) .

red summary(100,7) .
red initials(100,7) .

EOF
date
