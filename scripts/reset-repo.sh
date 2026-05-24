#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/reset-readme.sh
rm -rf example-data \
  mappings \
  in-shacl \
  data \
  output \
  template.xlsx \
  env.txt

mkdir data
touch data/.gitkeep
