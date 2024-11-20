FROM alpine:latest

LABEL maintainer="Prosad Kumar Das<prosaddas888@gmail.com>"

# Install necessary dependencies
RUN apk add --no-cache \
    bash bison \
    build-base \
    coreutils \
    zlib-dev \
    bzip2-dev \
    ncurses-dev \
    flex \
    gengetopt \
    gcc \
    gawk \
    help2man \
    lapack \
    m4 \
    perl-dev \
    perl \
    swig \
    autoconf \
    automake \
    libtool \
    pkgconf \
    wget \
    unzip \
    vim \
    python3 \
    py3-pip

# Install ViennaRNA version 2.7.0
RUN wget https://github.com/ViennaRNA/ViennaRNA/releases/download/v2.7.0/ViennaRNA-2.7.0.tar.gz && \
    tar -xzf ViennaRNA-2.7.0.tar.gz && \
    rm ViennaRNA-2.7.0.tar.gz && \
    cd ViennaRNA-2.7.0 && \
    bash ./configure && \
    make && \
    make check && \
    make install && \
    cd .. && \
    rm -rf ViennaRNA-2.7.0

# Verify installations
RUN RNAfold --version && \
    python3 --version

# Set default shell to bash
SHELL ["/bin/bash", "-c"]
