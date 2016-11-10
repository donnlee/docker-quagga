# HEADER
FROM alpine:3.4
MAINTAINER docker@pluza.com

# Install Quagga
# -v : Verbose
RUN apk -v --no-cache add bash quagga supervisor

# Supervisord
ADD supervisord.conf /etc/supervisord.conf

ADD bgpd.conf /etc/quagga/
ADD zebra.conf /etc/quagga/

# Expose ports
EXPOSE 179 2601 2605

# Start supervisord, which starts zebra & bgpd daemons.
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

# Enter the container with:
#   docker exec -it <container_id> /bin/bash
