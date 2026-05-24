#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
WORK_DIR="$SCRIPTS_DIR/../tmp"
DIRECTORY="$WORK_DIR/ap-data-to-dashboard"

if [ -d "$DIRECTORY" ]; then
  echo "Folder $DIRECTORY already exists, so no cloning"
else
  echo "Cloning ap-data-to-dashboard"
  git clone --depth 1 https://github.com/RMLio/ap-data-to-dashboard.git $DIRECTORY &> /dev/null
fi

