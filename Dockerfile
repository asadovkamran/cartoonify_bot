FROM ubuntu:latest

RUN apt-get -yqq update
RUN apt-get -yqq install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -yq nodejs
RUN npm install -g yarn

ADD . /opt/cartoonify_bot
WORKDIR /opt/cartoonify_bot
RUN yarn install
RUN yarn add typegoose

EXPOSE 5000

CMD ["yarn", "develop"]