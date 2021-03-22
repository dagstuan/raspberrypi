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
