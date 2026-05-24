#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
FORBIDDEN_BRANCH_NAMES=("assets" "queries" "images")
CURRENT_BRANCH=$1
USE_DIST=$2
WORK_DIR=$SCRIPTS_DIR"/../tmp"

# Sanitize branch
CURRENT_BRANCH=${CURRENT_BRANCH//\//-}

echo $CURRENT_BRANCH

# Check if branch name is forbidden.
[[ " ${FORBIDDEN_BRANCH_NAMES[*]} " =~ [[:space:]]${CURRENT_BRANCH}[[:space:]] ]] && echo "Branch name is forbidden!" && exit 1

if [[ "$CURRENT_BRANCH" == "main" ]]; then
  echo "Not using subdirectory because branch is main."
  rm -rf gh-pages/assets gh-pages/images gh-pages/queries

  if [[ "$USE_DIST" == "true" ]]; then
    mv $WORK_DIR/ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages
  else
    cp $SCRIPTS_DIR/dashboard-placeholder.html gh-pages/index.html
  fi
else
  echo "Using subdirectory because branch is not main."
  rm -rf gh-pages/$CURRENT_BRANCH
  mkdir -p gh-pages/$CURRENT_BRANCH

  if [[ "$USE_DIST" == "true" ]]; then
    mv $WORK_DIR/ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages/$CURRENT_BRANCH
  else
    cp $SCRIPTS_DIR/dashboard-placeholder.html gh-pages/$CURRENT_BRANCH/index.html
  fi
fi
