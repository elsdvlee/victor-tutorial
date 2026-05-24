#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

$SCRIPT_DIR/reset-readme.sh
rm -rf example-data \
  mappings \
  in-shacl \
  data \
  output \
  template.xlsx \
  dist \
  tmp

mkdir data
touch data/.gitkeep
echo "AP_URL=" > urls.env
echo "SHACL_URL=" >> urls.env
