FROM node:alpine
MAINTAINER jeremy.vaillant@dazzl.tv

ENV API_URL "http://petstore.swagger.io/v2/swagger.json"
ENV API_KEY ""

WORKDIR /app

RUN apk update \
    && apk upgrade \
    && apk add --no-cache git openjdk7-jre \
    && rm -rf /var/cache/apk/*

ADD package.json /app/package.json
ADD . /app

RUN npm install
RUN npm run build

RUN apk del git openjdk7-jre

CMD ["sh", "run.sh"]
