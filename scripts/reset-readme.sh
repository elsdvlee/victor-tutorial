#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FILE="$SCRIPTS_DIR/../README.md"
BACKUP_FILE="$SCRIPTS_DIR/../original-README.md"

mv $BACKUP_FILE $FILE
