#! /usr/bin/env bash
set -euxo pipefail
(( ! $# ))

#systemctl start cron
#exec start-stop-daemon --start --chuid signal-user:signal-user \
#    --exec $(which cron)
#cron -f
touch   /var/log/cron.log
cron
tail -f /var/log/cron.log

