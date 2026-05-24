#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WORK_DIR="$SCRIPTS_DIR/../tmp"
DIRECTORY="$SCRIPTS_DIR/../dashboard-config"

if [ -d "$DIRECTORY" ]; then
  echo "$DIRECTORY exists."
  rm -rf $WORK_DIR/ap-data-to-dashboard/miravi-initial-config
  mv $DIRECTORY $WORK_DIR/ap-data-to-dashboard/miravi-initial-config
else
  echo "$DIRECTORY doesn't exist. Using initial config."
fi

