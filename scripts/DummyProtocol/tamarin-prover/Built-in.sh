#!/bin/sh

date
echo

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

tamarin-prover "${SCRIPT_DIR}/../../../test/tamarin-prover/Built-in.spthy" --prove --derivcheck-timeout=0 -c=30 <<EOF

EOF
date
