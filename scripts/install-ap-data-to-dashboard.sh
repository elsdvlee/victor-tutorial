#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WORK_DIR="$SCRIPTS_DIR/../tmp"
TEST_FILE="install-setup-done"
ORIGINAL_DIR=$PWD

cd $WORK_DIR/ap-data-to-dashboard

if [ -f "$TEST_FILE" ]; then
  echo "Installation and setup already done"
else
  npm i &> /dev/null
  npm run setup &> /dev/null
  touch $TEST_FILE
fi

cd $ORIGINAL_DIR
