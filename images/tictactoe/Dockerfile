FROM node
USER root
#RUN apt-get update -y && \
#   apt-get -y upgrade && \
#    apt-get install -y \
#            nodejs   \ 
#            npm

WORKDIR /srv/
RUN git clone https://github.com/jsotogaviard/tictactoe
WORKDIR /srv/tictactoe
RUN npm install

RUN npm install server

COPY config.json /srv/tictactoe/config

RUN npm --version

WORKDIR /srv/tictactoe
RUN ls node_modules
CMD ["node_modules/.bin/gulp"]