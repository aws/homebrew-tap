#!/usr/bin/env bash
set -euo pipefail

# Get path of this script so that paths are relative to it.
# This allows it to be executed from anywhere on the file system.
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BUILD_DIR="${SCRIPTPATH}/build"
# Create temp dir at root to hold files during this execution
rm -rf ${BUILD_DIR}
mkdir -p ${BUILD_DIR}

export HOMEBREW_NO_INSTALL_CLEANUP=1

FAILED_BUILDS=()

echo "⏳ Setting up the build environment"
brew tap aws/tap # adding aws tap so that we can install bottles
brew install rename || : # Gnu rename to find and replace words in file name.
brew install jq || :

for formula_file in Formula/*.rb; do 
    [ ! -e "$formula_file" ] && continue
    BOTTLE=$(basename ${formula_file} .rb)
    ${SCRIPTPATH}/build-formula.sh -s -f "${formula_file}" || :
    for f in ${BUILD_DIR}/${BOTTLE}*.bottle.tar.gz; do
        [ ! -e "$f" ] && FAILED_BUILDS+=(${formula_file})
        break
    done
done

printf "\n"
echo "========================================================================="
if [[ ${#FAILED_BUILDS[@]} -gt 0 ]]; then
    echo "Failure Summary:"
    for failed_formula in "${FAILED_BUILDS[@]}"; do
        echo "    ❌ ${failed_formula} failed to build"
    done
else 
    echo "✅ Successfully built all formulas"
fi

printf "\n"
echo "Success Summary:"
for succeeded_formula in ${BUILD_DIR}/*.bottle.tar.gz; do
    [ ! -e "$succeeded_formula" ] && continue
    echo "    ✅ $(basename ${succeeded_formula} .bottle.tar.gz) was successfully built"
done
echo "========================================================================="
