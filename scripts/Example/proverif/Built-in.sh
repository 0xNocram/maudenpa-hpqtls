#!/bin/sh

date
echo

START_SECONDS=$(date +%s)
START_NS=$(date +%N) 

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

proverif "${SCRIPT_DIR}/../../../test/proverif/Built-in.pv" <<EOF
date
EOF

END_SECONDS=$(date +%s)
END_NS=$(date +%N)

ELAPSED_SECONDS=$((END_SECONDS - START_SECONDS))

# Handle sub-second precision if available (fallback to 0 if not)
if [ -n "$START_NS" ] && [ -n "$END_NS" ]; then
    ELAPSED_NS=$((END_NS - START_NS))
    if [ $ELAPSED_NS -lt 0 ]; then
        ELAPSED_NS=$((ELAPSED_NS + 1000000000))
        ELAPSED_SECONDS=$((ELAPSED_SECONDS - 1))
    fi
    ELAPSED_MS=$((ELAPSED_NS / 1000000))
    printf "Elapsed time: %d.%03d seconds\n" "$ELAPSED_SECONDS" "$ELAPSED_MS"
else
    echo "Elapsed time: ${ELAPSED_SECONDS} seconds"
fi