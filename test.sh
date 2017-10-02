#!/usr/bin/env bash

set -x

export DEBIAN_FRONTEND=noninteractive
export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty
export GTEST_DIR=${THIRDPARTY_DIR}/googletest-master/googletest
export GMOCK_DIR=${THIRDPARTY_DIR}/googletest-master/googlemock

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Test helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

git submodule update --init --force

./build-googlemock.sh
./gradlew --no-daemon check
