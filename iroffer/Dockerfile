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

RUN apt-fast update \
 && apt-fast install iroffer cron                   \
 && sed -i 's/ca-certificates//g' poobuntu-clean.sh \
 && ./poobuntu-clean.sh                             \
 && useradd -ms /bin/bash signal-user

#RUN sed -i -e 's~^\(session.*pam_loginuid.so\)$~#\1~' /etc/pam.d/crond
COPY        scheduler.txt .
USER signal-user
RUN crontab scheduler.txt
USER root
RUN rm -v   scheduler.txt
#RUN systemctl enable cron
VOLUME /home/signal-user/downloads/
VOLUME /home/signal-user/uploads/
VOLUME /var/log

WORKDIR /home/signal-user

#CMD        ["/usr/bin/env", "hexchat"]
#ENTRYPOINT ["/usr/bin/env", "hexchat"]
COPY iroffer.conf iroffer.cron entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

#USER root
#ENTRYPOINT chown -R signal-user:signal-user .*
