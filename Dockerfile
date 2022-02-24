FROM nginx:alpine

COPY . /usr/share/nginx/html

RUN apk add npm
RUN npm install apidoc -g
