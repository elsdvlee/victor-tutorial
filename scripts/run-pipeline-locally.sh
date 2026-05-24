#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Setting up repo"
$SCRIPTS_DIR/set-up-repo.sh || exit 1

echo "Generating RDF and building Miravi"
$SCRIPTS_DIR/generate-rdf-build-miravi-locally.sh || exit 1

