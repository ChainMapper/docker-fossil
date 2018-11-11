FROM chainmapper/walletbase-xenial
	
ENV WALLET_URL=https://dist.jurassic.host/fos/fossilcoin-1.3.0-linux.tar.gz

RUN wget $WALLET_URL -O /tmp/wallet.tar.gz \
	&& cd /usr/local/bin \
	&& tar xzvf /tmp/wallet.tar.gz --strip-components 1\
	&& rm /tmp/wallet.tar.gz

#rpc port & mainport
EXPOSE 6666 2727

RUN mkdir /data
ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
COPY wallet.sh /wallet.sh
RUN chmod 777 /*.sh
CMD /start.sh fossilcoin.conf FOS fossilcoind