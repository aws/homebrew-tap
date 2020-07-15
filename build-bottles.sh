#!/usr/bin/env bash
set -euo pipefail

# Get path of this script so that paths are relative to it.
# This allows it to be executed from anywhere on the file system.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR="${SCRIPTPATH}/build"
RESULTS_DIR="$BUILD_DIR/results"
# Create temp dir at root to hold files during this execution
rm -rf ${BUILD_DIR} ${RESULTS_DIR}
mkdir -p ${BUILD_DIR} ${RESULTS_DIR}

FAILED_BUILDS=()

export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1
BREW_CORE="homebrew/core"
SAVED_TAPS+=($(brew tap))
SAVED_TAPS=( "${SAVED_TAPS[@]/$BREW_CORE}" )

function cleanup() {
    for tap in "${SAVED_TAPS[@]}"; do 
      brew tap $tap
    done
}

trap cleanup err int term exit
brew untap "${SAVED_TAPS[@]}" || :

echo "⏳ Setting up the build environment"

for formula_file in Formula/*.rb; do 
    [ ! -e "$formula_file" ] && continue
    BOTTLE=$(basename ${formula_file} .rb)
    ${SCRIPTPATH}/build-formula.sh -l -f "${formula_file}" || :
    for f in ${RESULTS_DIR}/${BOTTLE}; do
        [ ! -e "$f" ] && FAILED_BUILDS+=(${formula_file})
        break
    done
done

printf "\n"
echo "========================================================================="
if [[ ${#FAILED_BUILDS[@]} -gt 0 ]]; then
    echo "Failure Summary:"
    for failed_formula in "${FAILED_BUILDS[@]}"; do
        echo "    ❌ $(basename ${failed_formula}) failed to build"
    done
else 
    echo "✅ Successfully built all formulas"
fi

printf "\n"
echo "Success Summary:"
for succeeded_formula in ${RESULTS_DIR}/*; do
    [ ! -e "$succeeded_formula" ] && continue
    echo "    ✅ $(basename ${succeeded_formula}) was successfully built"
done
echo "========================================================================="

