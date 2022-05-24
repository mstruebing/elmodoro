FROM node:16.13.1-alpine as builder

WORKDIR /src
COPY . /src

RUN npm install
RUN npm run build

FROM httpd:2.4.51-alpine

COPY --from=builder src/build /usr/local/apache2/htdocs/
EXPOSE 80
