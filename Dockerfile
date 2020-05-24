FROM innovanon/poobuntu:latest
MAINTAINER Innovations Anonymous <InnovAnon-Inc@protonmail.com>

LABEL version="1.0"                                                     \
      maintainer="Innovations Anonymous <InnovAnon-Inc@protonmail.com>" \
      about="dockerized hexchat"                                        \
      org.label-schema.build-date=$BUILD_DATE                           \
      org.label-schema.license="PDL (Public Domain License)"            \
      org.label-schema.name="docker-hexchat"                            \
      org.label-schema.url="InnovAnon-Inc.github.io/docker-hexchat"     \
      org.label-schema.vcs-ref=$VCS_REF                                 \
      org.label-schema.vcs-type="Git"                                   \
      org.label-schema.vcs-url="https://github.com/InnovAnon-Inc/docker-hexchat"

RUN apt-fast install hexchat \
 && ./poobuntu-clean.sh      \
 && useradd -ms /bin/bash signal-user
USER signal-user
WORKDIR /home/signal-user

#CMD        ["/usr/bin/env", "hexchat"]
ENTRYPOINT ["/usr/bin/env", "hexchat"]

#USER root
#ENTRYPOINT chown -R signal-user:signal-user .*
