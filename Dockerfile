FROM arm32v7/ubuntu:latest

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y nodejs npm libpcap-dev wget git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget http://node-arm.herokuapp.com/node_latest_armhf.deb
RUN dpkg -i node_latest_armhf.deb

RUN cd /root && \
    export GIT_SSL_NO_VERIFY=1 && \
    git config --global http.sslVerify false && \
    git clone https://github.com/maddox/dasher.git

WORKDIR /root/dasher
RUN cd /root/dasher && npm install

VOLUME /root/dasher/config

CMD cd /root/dasher && npm run start
