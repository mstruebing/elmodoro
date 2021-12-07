FROM node:16.13.1-alpine as builder

WORKDIR /src
COPY . /src

RUN npm install
RUN npm run build

FROM nginx:1.21.6-alpine

COPY --from=builder /src/build /usr/share/nginx/html
EXPOSE 80
