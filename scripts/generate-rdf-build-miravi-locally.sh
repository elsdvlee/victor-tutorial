#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
OUTPUT_DIR=$SCRIPTS_DIR"/../dist"
WORK_DIR=$SCRIPTS_DIR"/../tmp"
BASE_URL="http://localhost:5500/"

if compgen -G "data/*.xlsx" > /dev/null; then
  $SCRIPTS_DIR/generate-rdf-build-miravi.sh $BASE_URL

  echo "Moving Miravi dist to docs"
  rm -rf $OUTPUT_DIR/docs && mkdir $OUTPUT_DIR/docs
  mv $WORK_DIR/ap-data-to-dashboard/node_modules/miravi/main/dist/* $OUTPUT_DIR/docs

  echo ""
  echo ""
  echo "1. Host RDF files via \"npx http-server $OUTPUT_DIR/output -p 5500 --cors\""
  echo "2. Host Miravi via \"npx http-server $OUTPUT_DIR/docs -p 8080\""
  echo "3. Browse to http://localhost:8080"
else
  echo "No Excel files found in the data folder."
  exit 1
fi
