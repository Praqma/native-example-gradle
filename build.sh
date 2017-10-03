#!/usr/bin/env bash

set -x

export DEBIAN_FRONTEND=noninteractive
export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty
export GTEST_DIR=${THIRDPARTY_DIR}/googletest-master/googletest
export GMOCK_DIR=${THIRDPARTY_DIR}/googletest-master/googlemock

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Build helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

# Build Google Mock with Google Test
# https://github.com/google/googletest/tree/master/googlemock#preparing-to-build-unix-only

./build-googlemock.sh
./gradlew --no-daemon build
# ./gradlew --no-daemon checkMainExecutable
LD_LIBRARY_PATH=${WORKSPACE_DIR}/build/libs/greeter/shared/:${WORKSPACE_DIR}/build/libs/shapey/shared/ ${WORKSPACE_DIR}/build/exe/main/main