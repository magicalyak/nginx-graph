FROM node:14-alpine AS builder
COPY . ./nginxgraph
WORKDIR /nginxgraph
RUN apk add git python make g++ openssl-dev krb5-dev
RUN npm install --save-dev css-loader@3.5.3
RUN npm install --save-dev webpack@4.43.0
#Breaking?
RUN npm npm install express-ipfilter@1.1.2
RUN npm install --save-dev jquery@3.5.1
RUN npm run build:prod

FROM nginx:1-alpine
COPY --from=builder /graph/public/ /usr/share/nginx/html
EXPOSE 80