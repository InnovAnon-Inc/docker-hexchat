#! /usr/bin/env bash
set -euxo pipefail
(( ! $# ))

#systemctl start cron
#exec start-stop-daemon --start --chuid signal-user:signal-user \
#    --exec $(which cron)
#cron -f
touch   /var/log/cron.log
#exec start-stop-daemon --start --exec $(which cron) -- \
	cron -n -L "${LOGLEVEL:-4}"
tail -f /var/log/cron.log

