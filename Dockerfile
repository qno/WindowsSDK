FROM ubuntu:latest
ENV LANG C.UTF-8

# Create unprivileged user
RUN groupadd -g 1000 build
RUN useradd --create-home --uid 1000 --gid 1000 --shell /bin/bash build

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends p7zip-full

USER build
WORKDIR /home/build/
RUN pwd

COPY WindowsSDK.tar.7z /home/build/
RUN ls -lh && 7z x WindowsSDK.tar.7z && \
    tar -xf WindowsSDK.tar && \
    ls -lh && \
    rm WindowsSDK.* && \
    ls -lh
