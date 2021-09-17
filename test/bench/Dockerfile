FROM node:14-alpine

RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository http://dl-3.alpinelinux.org/alpine/edge/main python make g++ git vips-dev

RUN apk add imagemagick-dev
RUN apk add graphicsmagick-dev
#RUN apk add mapnik-dev

# copy sharp folder first so we can do relative import of sharp in bench.js ?
#WORKDIR /sharp
#COPY ../../package.json .
#RUN npm install
#COPY ../../ .

WORKDIR /sharp
COPY package.json .
RUN npm install
COPY . .

CMD ["node", "perf"]
