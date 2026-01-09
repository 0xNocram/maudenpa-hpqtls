#!/bin/sh

date
echo

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

tamarin-prover "${SCRIPT_DIR}/../../../test/tamarin-prover/VariadicSymbol.spthy" --prove --derivcheck-timeout=0 <<EOF

EOF
date
