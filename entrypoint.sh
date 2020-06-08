#! /usr/bin/env bash
set -euxo pipefail
(( ! $# ))

[[ -d    .local/share ]] ||
mkdir -v .local/share

hexchat

