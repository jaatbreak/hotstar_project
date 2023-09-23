FROM nginx:latest
MAINTAINER Aman Singh
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./assets  /usr/share/nginx/html
RUN apt update && apt install default-jre -y
EXPOSE 80


