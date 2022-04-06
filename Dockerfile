# build environment
FROM node:16-alpine as build
RUN apk add --no-cache git

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

ADD start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/start.sh"]


# run environment
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]