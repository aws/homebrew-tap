#!/usr/bin/env bash
set -euo pipefail

# Get path of this script so that paths are relative to it.
# This allows it to be executed from anywhere on the file system.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR="$SCRIPTPATH/build"
# Create temp dir at root to hold files during this execution
mkdir -p $BUILD_DIR

USAGE=$(cat << 'EOM'
  Usage: build-formula.sh  -f formula_file
  Builds the formula into a bottle and places it into the build dir.
  Example: build-formula.sh -f Formula/aws-sam-cli.rb
          Optional:
            -h          Print this usage help
EOM
)

SKIP_SETUP="false"

# Process our input arguments
while getopts "f:s" opt; do
  case ${opt} in
    f ) # Full Formula File Path
        FORMULA_FILE="${OPTARG}"
      ;;
    s ) # Skip setup
        SKIP_SETUP="true"
      ;;
    \? )
        echoerr "$USAGE" 1>&2
        exit
      ;;
  esac
done

BOTTLE=$(basename ${FORMULA_FILE} .rb)

function fail_msg() {
    echo "❌ Failed to build ${FORMULA_FILE} ❌"
    rm -f ${BUILD_DIR}/$BOTTLE*.bottle.tar.gz
    rm -f ${BUILD_DIR}/$BOTTLE*.bottle.json
    exit 2
}

trap fail_msg err int term kill

if [[ "${SKIP_SETUP}" = "false" ]]; then
    echo "⏳ Setting up the build environment"
    brew tap aws/tap # adding aws tap so that we can install bottles
    brew install rename || : # Gnu rename to find and replace words in file name.
    brew install jq || :
fi

echo "🎬 Starting formula build for ${FORMULA_FILE}"
brew uninstall -f ${BOTTLE}
brew install --build-bottle ${BOTTLE}

BOTTLE_CONFIG=$(jq -r '.' ${SCRIPTPATH}/bottle-configs/${BOTTLE}.json)
BOTTLE_ASSET_VERSION="$(echo ${BOTTLE_CONFIG} | jq -r '.version')"
echo "[${BOTTLE}]: Version -> ${BOTTLE_ASSET_VERSION}"
BOTTLE_ASSET_URL="$(echo ${BOTTLE_CONFIG} | jq -r '.bottle.root_url')"
echo "[${BOTTLE}]: Root URL -> ${BOTTLE_ASSET_URL}"
BIN_NAME=$(echo ${BOTTLE_CONFIG} | jq -r '.bin')
echo "[${BOTTLE}]: Bottle Binary -> ${BIN_NAME}"

# Need to cd since brew bottle doesn't have an option to 
cd "${BUILD_DIR}"
brew bottle --no-rebuild --json --root-url="${BOTTLE_ASSET_URL}" "${BOTTLE}"
cd ${SCRIPTPATH}

# Renaming aws-sam-cli--0.37.0.sierra.bottle.tar.gz to aws-sam-cli-0.37.0.sierra.bottle.tar.gz
rename 's/--/-/' ${BUILD_DIR}/*.tar.gz # replacing `--` with `-`

echo "[${BOTTLE}]: Brew bottles are built. Validating them now."
RELEASE_FILE="$(ls ${BUILD_DIR}/${BOTTLE}-*.bottle.tar.gz)"
echo "[${BOTTLE}]: Release file -> ${RELEASE_FILE}"

brew uninstall -f ${BOTTLE}
echo "[${BOTTLE}]: Installing release file"
brew install ${RELEASE_FILE}

BUILT_BOTTLE_VERSION="$(${BIN_NAME} --version | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')"
if [[ "${BOTTLE_ASSET_VERSION}" != "${BUILT_BOTTLE_VERSION}" ]]; then
    echo "❌ [${BOTTLE}]: Version check failed. Expected: ${BOTTLE_ASSET_VERSION}, Received: ${BUILT_BOTTLE_VERSION} ❌"
    exit 1
fi

echo "✅ [${BOTTLE}]: Verified that the new ${BOTTLE} version ${BUILT_BOTTLE_VERSION} is the same as what is expected ${BOTTLE_ASSET_VERSION} 🎉🥂✅"