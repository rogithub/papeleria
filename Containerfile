FROM debian:stable-slim AS build
WORKDIR /src
COPY . ./

RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y --allow-unauthenticated \
    hugo nginx

# create public folder
RUN hugo

RUN mv ./public /var/www/html/

RUN mv ./default /etc/nginx/sites-enabled/default


CMD ["nginx", "-g", "daemon off;"]
