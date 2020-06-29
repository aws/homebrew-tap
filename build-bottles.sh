#!/usr/bin/env bash

# Setting up build environment
brew tap aws/tap # adding aws tap so that we can install aws-sam-cli.
brew install rename # Gnu rename to find and replace words in file name.
brew install jq
brew uninstall -f aws-sam-cli
brew install --build-bottle aws-sam-cli

SAM_CLI_VERSION="$(cat bottle-config.json | jq -r '.version')"
echo "Sam cli version $SAM_CLI_VERSION"
ROOT_URL=$(echo "https://github.com/awslabs/aws-sam-cli/releases/download/v"$SAM_CLI_VERSION"/")
echo "Root url $ROOT_URL"

brew bottle --no-rebuild --json --root-url=$ROOT_URL aws-sam-cli

# Renaming aws-sam-cli--0.37.0.mojave.bottle.tar.gz to aws-sam-cli-0.37.0.sierra.bottle.tar.gz
rename 's/mojave/sierra/' aws-sam-cli* # replacing mojave with sierra.
rename 's/--/-/' aws-sam-cli* # replacing `--` with `-`

echo "Brew bottles are built. Validating them now."
RELEASE_FILE="$(ls *.bottle.tar.gz)"
echo "Release file: $RELEASE_FILE"

brew uninstall -f aws-sam-cli
echo "Installing release file"
brew install $RELEASE_FILE

NEW_SAM_CLI_VERSION="$(sam --version | cut -d ' ' -f 4)"
if [ $SAM_CLI_VERSION == $NEW_SAM_CLI_VERSION ]
then
    echo "Verified that new sam cli version $NEW_SAM_CLI_VERSION is same as what is expected $SAM_CLI_VERSION 🎉🥂✅"
else
    echo "Sam cli version check failed. Expected: $SAM_CLI_VERSION, Received: $NEW_SAM_CLI_VERSION ❌"
    exit 1
fi
