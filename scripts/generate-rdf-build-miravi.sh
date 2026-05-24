#!/usr/bin/env bash

SCRIPTS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR=`pwd`
WORK_DIR=$ROOT_DIR"/tmp"
OUTPUT_DIR=$ROOT_DIR/"dist"
BASE_URL=$1

mkdir -p $WORK_DIR
rm -rf $OUTPUT_DIR
mkdir $OUTPUT_DIR

cd $WORK_DIR
$SCRIPTS_DIR/clone-ap-data-to-dashboard.sh || exit 1
rm -rf ap-data-to-dashboard/in
mkdir ap-data-to-dashboard/in

echo "Copying ../data/* to ap-data-to-dashboard/in"
cp $ROOT_DIR/data/* ap-data-to-dashboard/in

echo "Copying ../in-shacl/* to ap-data-to-dashboard/in-shacl"
cp $ROOT_DIR/in-shacl/* ap-data-to-dashboard/in-shacl

echo "Installing ap-data-to-dashboard"
$SCRIPTS_DIR/install-ap-data-to-dashboard.sh

echo "Copying dashboard config"
$SCRIPTS_DIR/copy-dashboard-config.sh

echo "Running ap-data-to-dashboard"
cd $WORK_DIR/ap-data-to-dashboard
./run.sh -u $BASE_URL
cd $OUTPUT_DIR

echo "Moving RDF and mappings"
rm -rf output
mkdir output
rm -rf mappings
mkdir mappings
mv $WORK_DIR/ap-data-to-dashboard/out/serve-me/* output/
mv $WORK_DIR/ap-data-to-dashboard/out/*.rml.ttl mappings/
mv $WORK_DIR/ap-data-to-dashboard/out/*.yml mappings/
