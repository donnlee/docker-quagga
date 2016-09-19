# HEADER
FROM alpine:3.4
MAINTAINER docker@pluza.com

# Install Quagga
#RUN apk-install quagga supervisor
RUN apk -Uuv add bash quagga supervisor \
  && rm /var/cache/apk/*

# Supervisord
ADD supervisord.conf /etc/supervisord.conf

ADD bgpd.conf /etc/quagga/
ADD zebra.conf /etc/quagga/

# Expose ports
EXPOSE 179 2601 2605

# Command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

# Enter the container with:
#   docker exec -it <container_id> /bin/bash
