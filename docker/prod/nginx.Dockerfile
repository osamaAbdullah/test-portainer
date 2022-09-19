FROM node:alpine3.14 AS buildJS
WORKDIR /var/www/html
COPY . .
RUN npm install && npm run build

FROM nginx:stable-alpine
COPY --from=buildJS /var/www/html/build /var/www/html
COPY ./docker/prod/conf/nginx.conf /etc/nginx/conf.d/default.conf

