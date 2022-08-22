FROM debian:stable-slim AS build
WORKDIR /src
COPY . ./

# Change timezone to local time
ENV TZ=America/Mexico_City
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install nginx and hugo
RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y --allow-unauthenticated \
    hugo nginx

# create public folder
RUN hugo

RUN mv ./public /var/www/html/

RUN mv ./default /etc/nginx/sites-available/default


CMD ["nginx", "-g", "daemon off;"]
