FROM node:14.3

WORKDIR /app

COPY package.json yarn.lock ./

ENV LANG=C.UTF-8 \
  TZ=Asia/Tokyo \
  HOST=0.0.0.0

RUN apt-get update -y && \
  apt-get upgrade -y && \
  yarn add npm@6.14.4 && \
  yarn add ejs@3.0.1 &&\
  yarn add nuxt@2.0.0 &&\
  yarn add create-nuxt-app@2.15.0\
  yarn add defu@3.1.0

RUN yarn install

ADD . /app

CMD [ "yarn", "run", "dev" ]

EXPOSE 3000