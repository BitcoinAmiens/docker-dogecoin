FROM ubuntu:latest

RUN apt-get update

RUN apt-get -y install wget unzip

WORKDIR /usr/src

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0/dogecoin-1.10.0-linux64.tar.gz
RUN tar -xzvf dogecoin-1.10.0-linux64.tar.gz
RUN chmod +x dogecoin-1.10.0/bin/dogecoind dogecoin-1.10.0/bin/dogecoin-cli
RUN ln -s /usr/src/dogecoin-1.10.0/bin/dogecoind /usr/bin/dogecoind
RUN ln -s /usr/src/dogecoin-1.10.0/bin/dogecoin-cli /usr/bin/dogecoin-cli

RUN mkdir /root/data

ADD dogecoin.conf /root/.dogecoin/dogecoin.conf
RUN wget https://bootstrap.chain.so/bootstrap.dat -O /root/data/bootstrap.dat

EXPOSE 22555 22556

ENV RPCUSER user
ENV RPCPASS pass

CMD ["dogecoind", "-printtoconsole"]
