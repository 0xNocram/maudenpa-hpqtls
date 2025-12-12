#!/bin/sh

date

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

maude <<EOF

load "${SCRIPT_DIR}/../../../maude-npa.maude"
load "${SCRIPT_DIR}/../../../src/Example/Example-Associativity.maude"

red summary(2,0) .

red summary(2,1) .

red summary(2,2) .
red initials(2,2) .

EOF
date
