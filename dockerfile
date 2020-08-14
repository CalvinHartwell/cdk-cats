FROM ubuntu

# Set the file maintainer (your name - the file's author)
MAINTAINER calvinhartwell

# install nginx
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  rm -rf /etc/nginx/sites-enabled/default

# Copy the index.html & vhost config
COPY default /etc/nginx/sites-enabled/default
COPY html /usr/share/nginx/html
COPY html /var/www/html

# run nginx
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
