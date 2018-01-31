FROM ubuntu

# Set the file maintainer (your name - the file's author)
MAINTAINER calvinhartwell

# install nginx
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Copy the site to correct place
COPY html /usr/share/nginx/html

# entry point
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443

