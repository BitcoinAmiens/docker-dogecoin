FROM ubuntu:latest

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.14.6/dogecoin-1.14.6-x86_64-linux-gnu.tar.gz
RUN tar -xzvf dogecoin-1.14.6-x86_64-linux-gnu.tar.gz
RUN chmod +x dogecoin-1.14.6/bin/dogecoind dogecoin-1.14.6/bin/dogecoin-cli
RUN ln -s /usr/src/dogecoin-1.14.6/bin/dogecoind /usr/bin/dogecoind
RUN ln -s /usr/src/dogecoin-1.14.6/bin/dogecoin-cli /usr/bin/dogecoin-cli

EXPOSE 22555 22556 44555 44556 18444 18332

CMD ["dogecoind", "-printtoconsole", "-conf=/root/dogecoin.conf"]
