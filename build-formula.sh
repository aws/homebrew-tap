#!/usr/bin/env bash
set -euo pipefail

# echo commands as they executed
set -x

# Get path of this script so that paths are relative to it.
# This allows it to be executed from anywhere on the file system.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR="$SCRIPTPATH/build"
RESULTS_DIR="$BUILD_DIR/results"
# Create temp dir at root to hold files during this execution
mkdir -p $BUILD_DIR $RESULTS_DIR

export HOMEBREW_NO_INSTALL_CLEANUP=1
# Commenting out the auto upgrade since appveyor mac has an old version and fails buildilng bottles for SAM CLI
# export HOMEBREW_NO_AUTO_UPDATE=1

# for update of brew
brew update

function check_and_install_brew_pkg() {
  pkg="${1}"
  if [[ ! -z $(command -v ${pkg}) ]]; then
    return
  fi
  brew install "$@"
}

USAGE=$(cat << 'EOM'
  Usage: build-formula.sh  -f formula_file
  Builds the formula into a bottle and places it into the build dir.
  Example: build-formula.sh -f Formula/aws-sam-cli.rb
          
          Required:
            -f          Formula file to build

          Optional:
            -h          Print this usage help
            -u          Use existing tap instead of untapping and retapping
            -l          Dynamically sets the TAP to the first git remote found that is not the official aws tap
            -t          Specify a sepcific tap   i.e. `-t bwagner5/tap`
EOM
)


LOCAL_FORK=0
USE_EXISTING_TAP=0
AWS_TAP="aws/tap"
USER_TAP=""
TAP="${AWS_TAP}"

# Process our input arguments
while getopts "f:hult:" opt; do
  case ${opt} in
    f ) # Full Formula File Path
        FORMULA_FILE="${OPTARG}"
      ;;
    l ) # Local fork
        LOCAL_FORK=1
      ;;
    u ) # Use existing tap
        USE_EXISTING_TAP=1
      ;;
    t ) # tap
        USER_TAP="${OPTARG}"
      ;;
    h ) 
        echo "$USAGE" 1>&2
        exit 0
      ;;
    \? )
        echo "$USAGE" 1>&2
        exit 3
      ;;
  esac
done

if [[ "$#" -eq 0 ]]; then
    echo "ERROR: You must supply a formula file through -f"
    printf "\n"
    echo "$USAGE" 1>&2
    exit 4
fi

BREW_CORE="homebrew/core"
SAVED_TAPS+=($(brew tap))
SAVED_TAPS=( "${SAVED_TAPS[@]/$BREW_CORE}" )
BOTTLE=$(basename ${FORMULA_FILE} .rb)

if [[ ${USE_EXISTING_TAP} -eq 1 ]]; then
    SAVED_TAPS=( "${SAVED_TAPS[@]/$TAP}" )
fi

function fail_msg() {
    echo "❌ Failed to build ${FORMULA_FILE} ❌"
    rm -f ${BUILD_DIR}/$BOTTLE*.bottle.tar.gz
    rm -f ${BUILD_DIR}/$BOTTLE*.bottle.json
    brew uninstall -f ${BOTTLE} || :
    for tap in "${SAVED_TAPS[@]}"; do 
      brew tap $tap
    done
    exit 2
}

trap fail_msg err int term

brew untap "${SAVED_TAPS[@]}" 2>/dev/null || :

if [[ ${USER_TAP} != "" ]]; then
  TAP="${USER_TAP}"
elif [[ ${LOCAL_FORK} -eq 1 ]]; then
  ## find the first non-aws org tap which is assumed to be a user fork
  for remote in $(git remote); do 
    tap_url=$(git config --get remote.$remote.url)
    tap_name=$(echo $tap_url | rev | cut -d'-' -f1 | rev | cut -d'.' -f1)
    tap_ns=$(echo $tap_url | rev | cut -d'/' -f2 | cut -d':' -f1 | cut -d'/' -f1 | rev)
    fqt="${tap_ns}/${tap_name}"
    if [[ "${fqt}" != "${AWS_TAP}" ]]; then
      TAP="${fqt}"
      break
    fi
  done
fi

if [[ ${USE_EXISTING_TAP} -eq 0 ]]; then
    brew tap "${TAP}" || :
fi


check_and_install_brew_pkg jq

echo "🎬 Starting formula build for ${FORMULA_FILE}"
brew uninstall -f ${BOTTLE}

## Build formula from source locally
brew install --build-from-source "${SCRIPTPATH}/${FORMULA_FILE}"
brew uninstall -f ${BOTTLE}
## Build bottle
brew install --build-bottle ${TAP}/${BOTTLE}

BOTTLE_CONFIG=$(jq -r '.' ${SCRIPTPATH}/bottle-configs/${BOTTLE}.json)
BOTTLE_ASSET_VERSION="$(echo ${BOTTLE_CONFIG} | jq -r '.version')"
echo "[${BOTTLE}]: Version -> ${BOTTLE_ASSET_VERSION}"
BOTTLE_ASSET_URL="$(echo ${BOTTLE_CONFIG} | jq -r '.bottle.root_url')"
echo "[${BOTTLE}]: Root URL -> ${BOTTLE_ASSET_URL}"
BIN_NAME=$(echo ${BOTTLE_CONFIG} | jq -r '.bin')
echo "[${BOTTLE}]: Bottle Binary -> ${BIN_NAME}"

if [[ $(grep -c 'bottle :unneeded' "${FORMULA_FILE}") -eq 0 ]]; then 
  # Need to cd since brew bottle doesn't have an option to 
  cd "${BUILD_DIR}"
  brew bottle --no-rebuild --json --root-url="${BOTTLE_ASSET_URL}" "${TAP}/${BOTTLE}"
  cd ${SCRIPTPATH}

  RELEASE_FILE="$(ls ${BUILD_DIR}/${BOTTLE}--*.bottle.tar.gz)"
  # Renaming aws-sam-cli--0.37.0.sierra.bottle.tar.gz to aws-sam-cli-0.37.0.sierra.bottle.tar.gz
  # add debug statements for linux brew bottle issue
  ls ${BUILD_DIR}
  # add debug statements for linux brew bottle issue
  for f in ${BUILD_DIR}/*.bottle.*; do mv "$f" "$(echo "$f" | sed s/--/-/)"; done # replacing `--` with `-`
  ls ${BUILD_DIR}
  RELEASE_FILE=$(echo ${RELEASE_FILE} | sed 's/--/-/')

  echo "[${BOTTLE}]: Brew bottles are built. Validating them now."
  echo "[${BOTTLE}]: Release file -> ${RELEASE_FILE}"

  brew uninstall -f ${BOTTLE}
  echo "[${BOTTLE}]: Installing release file"
  brew install ${RELEASE_FILE}
fi

BUILT_BOTTLE_VERSION="$(${BIN_NAME} --version | grep -Eo '[0-9]+\.[0-9]+\.[0-9a-zA-Z\.]+')"
if [[ "${BOTTLE_ASSET_VERSION}" != "${BUILT_BOTTLE_VERSION}" ]]; then
    echo "❌ [${BOTTLE}]: Version check failed. Expected: ${BOTTLE_ASSET_VERSION}, Received: ${BUILT_BOTTLE_VERSION} ❌"
    exit 1
fi

echo "✅ [${BOTTLE}]: Verified that the new ${BOTTLE} version ${BUILT_BOTTLE_VERSION} is the same as what is expected ${BOTTLE_ASSET_VERSION} 🎉🥂✅"
## Touch results file for build-bottles summary
touch "${RESULTS_DIR}/${BOTTLE}"

brew uninstall -f ${BOTTLE}

for tap in "${SAVED_TAPS[@]}"; do 
  brew tap $tap
done
