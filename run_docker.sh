#!/usr/bin/env sh
set -e
clear

while [ $# -gt 0 ]; do
  case "$1" in
    -t|--tag) TAG="$2"; shift 2;;
    -o|--other-options) OTHER_OPTIONS="$2"; shift 2;;
    *) echo 'unknown argument'; exit 1;;
  esac
done

docker run -d --rm --name "$TAG" \
  --restart 'on-failure:3' \
  $OTHER_OPTIONS
