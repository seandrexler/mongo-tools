FROM ubuntu:22.04 as base

# install wget
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc |  tee /etc/apt/trusted.gpg.d/server-7.0.asc && \
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \
   apt-get update && \
   apt-get install -y mongodb-mongosh

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /root

ENTRYPOINT ["/entrypoint.sh"]
