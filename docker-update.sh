#/bin/sh
pushd $1

export DOCKER_HOST=ssh://pi@pi.local

docker-compose pull
docker-compose up -d --remove-orphans
docker image prune -f

unset DOCKER_HOST

popd
