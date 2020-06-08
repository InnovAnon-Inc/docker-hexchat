#! /usr/bin/env bash
set -euxo pipefail
(( ! $# ))

[[ -d     .local/share ]] ||
mkdir -pv .local/share

hexchat

