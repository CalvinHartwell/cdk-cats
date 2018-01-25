FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/
COPY ./cat.jpg /usr/share/nginx/html
