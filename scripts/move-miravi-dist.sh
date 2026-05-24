#!/usr/bin/env bash

CURRENT_BRANCH=$1
USE_DIST=$2

# Sanitize branch
CURRENT_BRANCH=${CURRENT_BRANCH//\//-}

echo $CURRENT_BRANCH

if [[ "$CURRENT_BRANCH" == "main" ]]; then
  echo "Not using subdirectory because branch is main."
  rm -rf gh-pages/assets gh-pages/images gh-pages/queries

  if [[ "$USE_DIST" == "true" ]]; then
    mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages
  else
    cp scripts/dashboard-placeholder.html gh-pages/index.html
  fi
else
  echo "Using subdirectory because branch is not main."
  rm -rf gh-pages/$CURRENT_BRANCH
  mkdir -p gh-pages/$CURRENT_BRANCH

  if [[ "$USE_DIST" == "true" ]]; then
    mv ap-data-to-dashboard/node_modules/miravi/main/dist/* gh-pages/$CURRENT_BRANCH
  else
    cp scripts/dashboard-placeholder.html gh-pages/$CURRENT_BRANCH/index.html
  fi
fi
