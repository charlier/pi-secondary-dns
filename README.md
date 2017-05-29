# Pi Secondary DNS

Docker container to run a secondary DNS Server on a Raspberry Pi (or anything ARM based)

## Build

```bash
docker build -t pi-secondary-dns .
```

Add your various zones to a zones.conf file (see example for examples)


## Run
```bash
docker run --rm -v $(pwd)/zones.conf:/etc/bind/zones.conf -p 53:53/tcp -p 53:53/udp pi-secondary-dns
```


## Issues

* Docker doesn't play nice with IPv6 out of the box
