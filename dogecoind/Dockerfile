FROM ubuntu:latest

RUN apt-get update

RUN apt-get -y install wget

WORKDIR /usr/src

RUN wget https://github.com/dogecoin/dogecoin/releases/download/v1.10.0/dogecoin-1.10.0-linux64.tar.gz
RUN tar -xzvf dogecoin-1.10.0-linux64.tar.gz
RUN chmod +x dogecoin-1.10.0/bin/dogecoind dogecoin-1.10.0/bin/dogecoin-cli
RUN ln -s /usr/src/dogecoin-1.10.0/bin/dogecoind /usr/bin/dogecoind
RUN ln -s /usr/src/dogecoin-1.10.0/bin/dogecoin-cli /usr/bin/dogecoin-cli

ADD dogecoin.conf /root/.dogecoin/dogecoin.conf

#RUN mkdir /root/data
#RUN wget https://bootstrap.chain.so/bootstrap.dat -O /root/data/bootstrap.dat

EXPOSE 22555 22556 44555 44556

CMD ["dogecoind", "-printtoconsole"]
