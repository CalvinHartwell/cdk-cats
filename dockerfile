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

# Copy the index.html
COPY html /usr/share/nginx/html
COPY html /var/www/html

# replace with correct hostname
RUN \
hostname=`hostname -f` && \
sed -i "s/XXX/${hostname}/" /usr/share/nginx/html/index.html && \
sed -i "s/XXX/${hostname}/" /var/www/html/index.html

# run nginx
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
