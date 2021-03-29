# Raspberry pi docker setup

## Inne på pi via SSH:

`sudo apt-get update && sudo apt-get upgrade`

`curl -sSL https://get.docker.com | sh`

`sudo usermod -aG docker pi`

`sudo reboot`

*etter reboot*

`docker run hello-world`

### Docker compose

```
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
```

```
sudo pip3 install docker-compose
```

## På lokal maskin

gå inn i en av mappene. Kjør `DOCKER_HOST=ssh://pi@[hostname_til_rpi] docker-compose up -d`

# Dynamic DNS

`/etc/ddclient.conf`:

```
#daemon=1800
syslog=yes
ssl=yes

use=web, web=dynamicdns.park-your-domain.com/getip
protocol=cloudflare
zone=dagstuan.com
login=[email]
password=[cloudflare-master-api-key]
home
```


# HTTPS

https://certbot.eff.org

sudo certbot certonly \
  --dns-cloudflare \
  --dns-cloudflare-credentials [path/to/secrets.ini] \
  -d dagstuan.com,*.dagstuan.com\
  --preferred-challenges dns-01\
  --deploy-hook "cp -uL /etc/letsencrypt/live/dagstuan.com/* /usr/share/hassio/ssl/ && docker restart homeassistant"

hassio `configuration.yml`:

```
http:
  ssl_certificate: /ssl/fullchain.pem
  ssl_key: /ssl/privkey.pem
```
