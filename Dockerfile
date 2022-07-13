FROM nginx:1.23.0-alpine
MAINTAINER Focusate JSC <dev@focusate.eu>

# Demo page is useless, so we are removing it to not interfere.
RUN rm /etc/nginx/conf.d/default.conf \
    && mkdir /etc/ssl/nginx

COPY ./config/dhparam.pem /etc/ssl/certs/dhparam.pem
COPY ./config/nginx.conf ./config/custom_error_page.conf /etc/nginx/
COPY ./config/custom_502.html ./config/maintenance_logo.png /usr/share/nginx/html/
