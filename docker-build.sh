#!/usr/bin/env bash

docker build --tag praqma/native-gradle:latest --file ${PWD}/Dockerfile ${PWD}
