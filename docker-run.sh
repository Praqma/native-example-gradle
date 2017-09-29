#!/bin/bash
set -e
docker run --rm -it -v $PWD:/code -v ~/.gradle:/root/.gradle -w /code praqma/native-gradle /code/build/exe/main/main
