FROM ubuntu:18.10

RUN apt-get update && apt-get install -y g++ build-essential cmake git libncurses-dev zlib1g-dev \
      libevent-dev \
      libcrypto++-dev libmsgpack-dev libjsoncpp-dev \
      libmysqlcppconn-dev libgtest-dev cmake libgoogle-perftools-dev \
      libssl-dev libmysqlclient-dev libcrypto++-dev libc6-dev libc6-dev-i386 \
      clang libclang-dev llvm

RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls

RUN cd ccls && cmake -H. -BRelease -DDCMAKE_BUILD_TYPE=Release && cmake --build Release --target install

ENTRYPOINT ["/bin/bash"]

