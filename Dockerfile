FROM openjdk:8

RUN apt-get update && apt-get install --yes build-essential

ENV DEBIAN_FRONTEND=noninteractive
ENV THIRDPARTY_DIR=/code/3rdparty
ENV GTEST_DIR=${THIRDPARTY_DIR}/googletest-master/googletest
ENV GMOCK_DIR=${THIRDPARTY_DIR}/googletest-master/googlemock
ENV LD_LIBRARY_PATH=/code/build/libs/greeter/shared/:/code/build/libs/shapey/shared/

RUN mkdir /code
WORKDIR /code
