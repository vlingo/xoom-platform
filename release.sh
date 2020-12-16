#!/bin/bash

RELEASE=${1:-""}

function help() {
    echo "$0 release_tag"
    echo ""
    echo "Updates the version in pom.xml, then commits and tags it."
    echo ""
    echo "Example:"
    echo ""
    echo "  $0 1.2.3"
    echo ""
    exit 0
}

[[ "$RELEASE" != "" ]] || help

PREV_RELEASE=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

echo "Previous release: $PREV_RELEASE"
echo "Do you wish to release $RELEASE?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "Preparing the release..."; break;;
        No ) echo "Aborted."; exit;;
    esac
done

mvn versions:set -q -DnewVersion=$RELEASE
git add pom.xml
git commit -m "Release v$RELEASE"
git tag "$RELEASE" -m 'Release v$RELEASE'
git push --follow-tags

echo "OK"
