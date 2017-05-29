FROM armhf/alpine

RUN apk --update upgrade && \
  apk add --update bind && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /etc/bind/slave && \
  chown named:named /etc/bind/slave && \
  cp /etc/bind/named.conf.authoritative /etc/bind/named.conf && \
  sed -i -e 's/listen-on { 127.0.0.1; };/listen-on { any; };/g' /etc/bind/named.conf && \
  echo 'include "/etc/bind/zones.conf";' >> /etc/bind/named.conf

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named", "-f"]
