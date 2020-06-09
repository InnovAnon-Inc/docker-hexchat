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

# && curl -o /usr/local/bin/waitall                  \
#    https://raw.githubusercontent.com/InnovAnon-Inc/repo/master/waitall.sh \
RUN apt-fast update \
 && apt-fast install rss2irc                        \
 && sed -i 's/ca-certificates//g' poobuntu-clean.sh \
 && ./poobuntu-clean.sh                             \
 && useradd -ms /bin/bash signal-user

#RUN sed -i -e 's~^\(session.*pam_loginuid.so\)$~#\1~' /etc/pam.d/crond
USER signal-user
WORKDIR /home/signal-user

#CMD        ["/usr/bin/env", "hexchat"]
#ENTRYPOINT ["/usr/bin/env", "hexchat"]
COPY entrypoint.sh /
#ARG FEEDURL
#ENV FEEDURL="$FEEDURL"
#ARG PORT
#ENV PORT="$PORT"
#ARG CHANNEL
#ENV CHANNEL="$CHANNEL"
#ARG NICK
#ENV NICK="$NICK"
#ARG OPTIONS
#ENV OPTIONS="$OPTIONS"
#ARG DELAY
#ENV DELAY="$DELAY"

ENTRYPOINT ["/entrypoint.sh"]

#USER root
#ENTRYPOINT chown -R signal-user:signal-user .*
