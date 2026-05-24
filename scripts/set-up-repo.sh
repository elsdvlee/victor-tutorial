#!/usr/bin/env bash

set -a # automatically export all variables
source urls.env
set +a

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=`pwd`
WORK_DIR=$ROOT_DIR"/tmp"

mkdir -p $WORK_DIR

if [ "$SHACL_URL" != "" -a "$AP_URL" != "" ]; then
  echo "AP url is $AP_URL"
  echo "SHACL url is $SHACL_URL"

  echo "Downloading SHACL"
  $SCRIPTS_DIR/download-shacl.sh $SHACL_URL || exit 1

  echo "Adding AP and SHACL links to README"
  $SCRIPTS_DIR/update-readme.sh $ap_url $shacl_url

  if [ -f "$ROOT_DIR/template.xlsx" ]; then
    echo "Template and example data already exist"
  else
    cd $WORK_DIR
    $SCRIPTS_DIR/clone-ap-data-to-dashboard.sh || exit 1

    echo "Copying shacl file in-shacl directory"
    cp $ROOT_DIR/in-shacl/* $WORK_DIR/ap-data-to-dashboard/in-shacl || exit 1

    cd $WORK_DIR
    echo "Installing ap-data-to-dashboard"
    $SCRIPTS_DIR/install-ap-data-to-dashboard.sh &> /dev/null || exit 1

    echo "Generating template and example data"
    cd ap-data-to-dashboard
    node src/shacl-to-template.js || exit 1

    echo "Moving template and example data"
    cp in-shacl/template.xlsx $ROOT_DIR/template.xlsx
    cp in-shacl/template.schema.json $ROOT_DIR/in-shacl/template.schema.json
    rm -rf $ROOT_DIR/example-data && mkdir $ROOT_DIR/example-data
    cp in-shacl/dummy* $ROOT_DIR/example-data
  fi
else
  echo "ERROR: AP url or SHACL url is not defined. Please update the file \"urls.env\"."
  exit 1
fi
