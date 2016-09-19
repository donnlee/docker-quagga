# HEADER
FROM alpine:latest
MAINTAINER docker@pluza.com

# Install Quagga
RUN apk-install quagga supervisor

# Supervisord
ADD         supervisord.conf /etc/supervisord.conf

ADD bgpd.conf /etc/quagga/
ADD zebra.conf /etc/quagga/

# Expose ports
EXPOSE 179 2601 2605

# Command
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

