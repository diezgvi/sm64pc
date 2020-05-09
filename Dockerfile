FROM ubuntu:18.04 as build

RUN apt-get update && \
    apt-get install -y \
        binutils-mips-linux-gnu \
        bsdmainutils \
        build-essential \
        libaudiofile-dev \
        libglew-dev \
        libglfw3-dev \
        libusb-1.0-0 \
        libsdl2-dev \
        pkg-config \
        python3 \
        wget \
        zlib1g-dev

RUN mkdir /sm64pc
WORKDIR /sm64pc
ENV PATH="/sm64pc/tools:${PATH}"

CMD echo 'usage: docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64pc sm64pc make VERSION=${VERSION:-us} TARGET_BITS=64 -j4\n' \
         'see https://github.com/sm64pc/sm64pc/blob/master/README.md for advanced usage'
