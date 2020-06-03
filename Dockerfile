FROM node:14-alpine AS builder
COPY . ./nginxgraph
WORKDIR /nginxgraph
RUN apk add git openssl-dev alpine-sdk python krb5-dev
RUN npm install
RUN npm run build:prod

FROM nginx:1-alpine
COPY --from=builder /graph/public/ /usr/share/nginx/html
EXPOSE 80