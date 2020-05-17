FROM poobuntu:latest

RUN apt-fast install -y hexchat

RUN ./poobuntu-clean.sh
RUN rm -v poobuntu-clean.sh

RUN useradd -ms /bin/bash signal-user
USER signal-user
WORKDIR /home/signal-user

CMD        ["/usr/bin/env", "hexchat"]
ENTRYPOINT ["/usr/bin/env", "hexchat"]

