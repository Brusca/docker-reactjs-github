FROM node:16-alpine

RUN apk add --no-cache git

WORKDIR /usr/src/app

EXPOSE 80

ADD start.sh /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]