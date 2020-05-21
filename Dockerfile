FROM innovanon/poobuntu:latest
MAINTAINER Innovations Anonymous <InnovAnon-Inc@protonmail.com>

LABEL version="1.0"
LABEL maintainer="Innovations Anonymous <InnovAnon-Inc@protonmail.com>"
LABEL about="dockerized hexchat"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.license="PDL (Public Domain License)"
LABEL org.label-schema.name="docker-hexchat"
LABEL org.label-schema.url="InnovAnon-Inc.github.io/docker-hexchat"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-type="Git"
LABEL org.label-schema.vcs-url="https://github.com/InnovAnon-Inc/docker-hexchat"

RUN apt-fast install hexchat

RUN ./poobuntu-clean.sh
RUN rm -v poobuntu-clean.sh

RUN useradd -ms /bin/bash signal-user
USER signal-user
WORKDIR /home/signal-user

#CMD        ["/usr/bin/env", "hexchat"]
ENTRYPOINT ["/usr/bin/env", "hexchat"]

#USER root
#ENTRYPOINT chown -R signal-user:signal-user .*
