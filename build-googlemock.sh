#!/usr/bin/env bash

set -x

export DEBIAN_FRONTEND=noninteractive
export WORKSPACE_DIR=/workspace
export THIRDPARTY_DIR=${WORKSPACE_DIR}/3rdparty

export GTEST_DIR=${THIRDPARTY_DIR}/googletest-master/googletest
export GTEST_LIBRARY_DIR=${GTEST_DIR}/lib
export GTEST_OBJECT_DIR=${GTEST_DIR}/obj

export GMOCK_DIR=${THIRDPARTY_DIR}/googletest-master/googlemock
export GMOCK_LIBRARY_DIR=${GMOCK_DIR}/lib
export GMOCK_OBJECT_DIR=${GMOCK_DIR}/obj

if [ "$PWD" != "$WORKSPACE_DIR" ]; then
  echo "Build helper script to be run inside a container."
  echo "Go to $WORKSPACE_DIR directory before running this script."
  exit 1
fi

git submodule update --init --force

# Build Google Mock
# https://github.com/google/googletest/tree/master/googlemock#preparing-to-build-unix-only

mkdir -p ${GTEST_LIBRARY_DIR} ${GTEST_OBJECT_DIR}
mkdir -p ${GMOCK_LIBRARY_DIR} ${GMOCK_OBJECT_DIR}

g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} \
    -pthread -c ${GTEST_DIR}/src/gtest-all.cc \
    -o ${GTEST_OBJECT_DIR}/gtest-all.o

ar -rv ${GTEST_BUILD_DIR}/libgtest.a ${GTEST_OBJECT_DIR}/gtest-all.o

g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} \
    -isystem ${GMOCK_DIR}/include -I${GMOCK_DIR} \
    -pthread -c ${GTEST_DIR}/src/gtest-all.cc \
    -o ${GTEST_OBJECT_DIR}/gtest-all.o

g++ -isystem ${GTEST_DIR}/include -I${GTEST_DIR} \
    -isystem ${GMOCK_DIR}/include -I${GMOCK_DIR} \
    -pthread -c ${GMOCK_DIR}/src/gmock-all.cc \
    -o ${GMOCK_OBJECT_DIR}/gmock-all.o

ar -rv ${GMOCK_LIBRARY_DIR}/libgmock.a ${GTEST_OBJECT_DIR}/gtest-all.o ${GMOCK_OBJECT_DIR}/gmock-all.o

# find 3rdparty/googletest-master/{googletest,googlemock}/{lib,obj}