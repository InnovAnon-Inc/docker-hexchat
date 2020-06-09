#! /usr/bin/env bash
set -euxo pipefail
(( ! $# ))
[[ "$DELAY"   ]]
[[ "$FEEDURL" ]]
[[ "$PORT"    ]]
[[ "$CHANNEL" ]]
[[ "$NICK"    ]]

set -a P
for IRCSERVER in {InnovAnon-Inc,lmaddox}.chickenkiller.com ; do
  # TODO bad regex
  IP="$(getent hosts "$IRCSERVER" | awk '/^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*/ { print $1 ; exit }')"
  IP="${IP:-$IRCSERVER}"
  #start-stop-daemon --start --chuid signal-user:signal-user        \
  #  --exec $(which rss2irc) --                                     \
  rss2irc \
  --delay="$((RANDOM % "DELAY" + 1))" \
    ${OPTIONS:-} "$FEEDURL" "$IP:$PORT/$CHANNEL/$NICK" &
  P+=( "$!" )
done

#while (( "${#P[@]}" )) ; do
#  h=("${P[@]:1:1}")
#  t=("${P[@]:2}")
#  if wait -n "${h[@]}" ; then
#    P=("${t}")
#  else
#    P=("${h} ${t}")
#  fi
#done

wait -n "${P[@]}"

