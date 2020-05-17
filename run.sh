#! /bin/bash
set -exu

if ! command -v dockerd ; then
	command -v wget ||
	apt install wget
	wget -nc https://download.docker.com/linux/static/stable/x86_64/docker-19.03.8.tgz
	[ -d docker-19.03.8 ] ||
	tar xf docker-19.03.8.tgz
	install docker/* /usr/local/bin/
fi

docker version ||
dockerd &

sudo             -- \
nice -n -20      -- \
sudo -u `whoami` -- \
docker build -t docker-hexchat .

docker volume inspect hexchatvol ||
docker volume create  hexchatvol

#docker run --rm --name docker-hexchat      \
#	--net=host -e DISPLAY=${DISPLAY}  \
#	-v /tmp/.X11-unix/:/tmp/.X11-unix \
#	-v hexchatvol:/home/hexchat-user    \
#	-e XAUTHORITY                     \
#	-v $XAUTHORITY:$XAUTHORITY        \
#	-t docker-hexchat

docker run --rm --name docker-hexchat      \
	--net=host -e DISPLAY=${DISPLAY}  \
	-v /tmp/.X11-unix/:/tmp/.X11-unix \
	-v hexchatvol:/home/signal-user    \
	-e XAUTHORITY                     \
	-v $XAUTHORITY:$XAUTHORITY        \
	-t docker-hexchat
