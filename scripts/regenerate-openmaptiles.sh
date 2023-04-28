#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

TAG="${1:-"planetiler_v2"}"
echo "tag=${TAG}"

BASE_URL="${2:-"https://raw.githubusercontent.com/boldtrn/openmaptiles/"}"
echo "base-url=${BASE_URL}"

echo "Building..."
./mvnw -DskipTests=true package

echo "Running..."
java -cp target/*-with-deps.jar org.openmaptiles.Generate -tag="${TAG}" -base-url="${BASE_URL}"

echo "Formatting..."
./scripts/format.sh
