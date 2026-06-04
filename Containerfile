FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
    sudo \
    passwd \
    bash \
    coreutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /labs

COPY . /labs

RUN chmod +x /labs/user-management/lab.sh

CMD ["/bin/bash"]
