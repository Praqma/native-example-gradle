FROM openjdk:8

RUN apt-get update \
  && apt-get install --yes \
  build-essential \
  procps \
  && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 jenkins
RUN useradd -r -u 1000 -g 1000 jenkins
