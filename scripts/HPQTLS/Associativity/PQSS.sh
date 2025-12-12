#!/bin/sh

ulimit -s 262144 2>/dev/null || ulimit -s unlimited 2>/dev/null || ulimit -s 131072

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../src/HPQTLS/HPQTLS-Associativity.maude"

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
