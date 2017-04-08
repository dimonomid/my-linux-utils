#!/bin/bash

set -e

SRC="$1"
DST="$2"

# --no-header
ENSCRIPT_FLAGS="--font 'CourierNew-Bold11' --margins=10:10:10:80"

if [[ "x${SRC}" == "x" ]]; then
  echo "Generate pdf output from txt Linux Kernel Documentation"
  echo "Usage: $0 /path/to/linux-source/Documentation [/path/to/output-dir]"
  exit 1
fi

if [[ "x${DST}" == "x" ]]; then
  DST="./output"
fi

DST="$(readlink -f ${DST})"

mkdir -p "${DST}"

pushd "${SRC}"

find -name "*.txt" -exec bash -c " \
  if [ ! -f '${DST}/{}.pdf' ]; then \
    echo -n 'Converting {}... ' && \
    mkdir -p \"${DST}/\$(dirname {})\" && \
    enscript ${ENSCRIPT_FLAGS} -p - {} | ps2pdf - '${DST}/{}.pdf'; \
  else \
    echo 'Skipping {}'; \
  fi" \;

popd
