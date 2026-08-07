FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        debhelper \
        dh-python \
        git \
        python3-all \
        python3-pip \
        python3-setuptools \
        quilt \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

ENTRYPOINT ["make"]
