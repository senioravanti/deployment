#!/usr/bin/env sh
set -e
clear

PLATFORM='linux/amd64'

while [ $# -gt 0 ]; do
  case "$1" in
    -t|--tag) TAG="$2"; shift 2;;
    -p|--platform) PLATFORM="$2"; shift 2;;
    -o|--other-options) OTHER_OPTIONS="$2"; shift 2;;
    -d|--dockerfile) DOCKERFILE_PATH="$2"; shift 2;;
    --project-dir) PROJECT_DIR="$2"; shift 2;;
    --no-cache) IS_NO_CACHE='--no-cache'; shift;;
    --push) IS_PUSH='--push'; shift;;
    *) echo 'unknown argument'; exit 1;;
  esac
done

docker build "$PROJECT_DIR" \
  -f "$DOCKERFILE_PATH" \
  --platform "$PLATFORM" -t "$TAG" \
  $IS_NO_CACHE $IS_PUSH $OTHER_OPTIONS
