FROM  alpine:latest
RUN   adduser -S -D -H -h /xmrig miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        cmake \
        libuv-dev \
        build-base \
        openssl-dev \
        cuda \
        libmicrohttpd-dev && \
      git clone https://github.com/xmrig/xmrig-cuda xmrig && \
      cd xmrig && \
      git checkout v6.15.1 && \
      mkdir build && \
      cmake -DWITH_HWLOC=OFF -DCUDA_LIB=/usr/local/cuda/lib64/stubs/libcuda.so -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda . && \
      make && \
      apk del \
        build-base \
        cmake \
        git
USER miner
WORKDIR    /xmrig
COPY config.json /xmrig
EXPOSE 80
ENTRYPOINT  ["./xmrig"]
