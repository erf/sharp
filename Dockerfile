FROM node:14-alpine

RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository http://dl-3.alpinelinux.org/alpine/edge/main python make g++ git vips-dev

RUN apk add imagemagick-dev
RUN apk add graphicsmagick-dev
#RUN apk add mapnik-dev

# for inspecting
RUN apk add vim

WORKDIR /app
COPY package.json .
RUN npm install
COPY . ./

WORKDIR /app/test/bench
RUN npm install

CMD ["node", "perf"]
