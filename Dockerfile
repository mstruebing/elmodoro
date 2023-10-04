FROM node:20.6.1-alpine as builder

WORKDIR /src


ADD package*.json /src
RUN npm install

ADD . /src
# Need this option because of ssl issue: 
# https://github.com/halfzebra/create-elm-app/issues/604
RUN NODE_OPTIONS=--openssl-legacy-provider npm run build

FROM nginx:mainline-alpine

COPY --from=builder /src/build /usr/share/nginx/html
EXPOSE 80
