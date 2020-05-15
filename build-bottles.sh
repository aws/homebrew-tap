#!/bin/bash
set -euo errexit

# Get path of this script so that paths are relative to it.
# This allows it to be executed from anywhere on the file system.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR="$SCRIPTPATH/build"
# Create temp dir at root to hold files during this execution
rm -rf $BUILD_DIR
mkdir -p $BUILD_DIR

# Setting up build environment
brew tap aws/tap # adding aws tap so that we can install bottles
brew install rename || : # Gnu rename to find and replace words in file name.
brew install jq || :

for bottle_file in Formula/*.rb; do 
    BOTTLE=$(basename $bottle_file .rb)
    brew uninstall -f $BOTTLE
    brew install --build-bottle $BOTTLE

    BOTTLE_CONFIG=$(jq -r '.' $SCRIPTPATH/bottle-configs/$BOTTLE.json)
    BOTTLE_ASSET_VERSION="$(echo $BOTTLE_CONFIG | jq -r '.version')"
    echo "[$BOTTLE]: Version -> $BOTTLE_ASSET_VERSION"
    BOTTLE_ASSET_URL="$(echo $BOTTLE_CONFIG | jq -r '.bottle.root_url')"
    echo "[$BOTTLE]: Root URL -> $BOTTLE_ASSET_URL"
    BIN_NAME=$(echo $BOTTLE_CONFIG | jq -r '.bin')
    echo "[$BOTTLE]: Bottle Binary -> $BIN_NAME"

    cd $BUILD_DIR
    brew bottle --no-rebuild --json --root-url=$BOTTLE_ASSET_URL $BOTTLE
    cd $SCRIPTPATH

    # Renaming aws-sam-cli--0.37.0.sierra.bottle.tar.gz to aws-sam-cli-0.37.0.sierra.bottle.tar.gz
    rename 's/--/-/' $BUILD_DIR/*.tar.gz # replacing `--` with `-`

    echo "[$BOTTLE]: Brew bottles are built. Validating them now."
    RELEASE_FILE="$(ls $BUILD_DIR/$BOTTLE-*.bottle.tar.gz)"
    echo "[$BOTTLE]: Release file -> $RELEASE_FILE"

    brew uninstall -f $BOTTLE
    echo "[$BOTTLE]: Installing release file"
    brew install $RELEASE_FILE

    BUILT_BOTTLE_VERSION="$($BIN_NAME --version | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
    if [[ "$BOTTLE_ASSET_VERSION" == "$BUILT_BOTTLE_VERSION" ]]
    then
        echo "✅ [$BOTTLE]: Verified that the new $BOTTLE version $BUILT_BOTTLE_VERSION is the same as what is expected $BOTTLE_ASSET_VERSION 🎉🥂✅"
    else
        echo "❌ [$BOTTLE]: Version check failed. Expected: $BOTTLE_ASSET_VERSION, Received: $BUILT_BOTTLE_VERSION ❌"
        exit 1
    fi
done