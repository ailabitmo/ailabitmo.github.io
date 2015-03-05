FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y git nodejs ruby ruby1.9.1-dev npm

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g forever

RUN gem install jekyll rdiscount json
RUN apt-get install -y nginx

RUN git clone https://github.com/developmentseed/jekyll-hook.git
RUN cd jekyll-hook && pwd && npm install

WORKDIR /jekyll-hook

ADD config.json /jekyll-hook/

CMD ["./jekyll-hook.js"]
