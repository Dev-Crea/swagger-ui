FROM node:alpine
MAINTAINER jeremy.vaillant@dazzl.tv

WORKDIR /app

RUN apk add --no-cache git openjdk7-jre

ADD package.json /app/package.json
ADD . /app

RUN npm install
RUN npm run build

RUN apk del git openjdk7-jre

CMD ./node_modules/gulp/bin/gulp.js serve
