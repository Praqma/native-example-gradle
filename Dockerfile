FROM openjdk:8

RUN apt-get update && apt-get install --yes build-essential

ENV DEBIAN_FRONTEND=noninteractive
ENV THIRDPARTY_DIR=${PWD}/3rdparty
ENV GTEST_DIR=${THIRDPARTY_DIR}/googletest-master/googletest
ENV GMOCK_DIR=${THIRDPARTY_DIR}/googletest-master/googlemock
