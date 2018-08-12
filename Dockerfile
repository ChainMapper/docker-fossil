FROM chainmapper/walletbase-trusty
	
ENV WALLET_URL=https://github.com/FOScoin/Wallets/blob/master/FOSLINUX.zip?raw=true

RUN wget $WALLET_URL -O /tmp/wallet.zip \
	&& unzip -j /tmp/wallet.zip -d /usr/local/bin \
	&& chmod +x /usr/local/bin/*

#rpc port & mainport
EXPOSE 2828 2727

RUN mkdir /data
ENV HOME /data

COPY start.sh /start.sh
COPY gen_config.sh /gen_config.sh
RUN chmod 777 /*.sh
CMD /start.sh fossilcoin.conf FOS fossilcoind