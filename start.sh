#!/bin/sh

GIT_COMMAND='git clone '

if [ ! -z "$GIT_BRANCH" ]; then
    GIT_COMMAND=${GIT_COMMAND}" -b ${GIT_BRANCH}"
fi

if [ -z "$GIT_USERNAME" ]; then
    echo "GIT_USERNAME not found!"
    exit 1
fi

if [ -z "$GIT_PERSONAL_TOKEN" ]; then
    echo "GIT_PERSONAL_TOKEN not found!"
    exit 1
fi

if [ -z "$GIT_REPO" ]; then
    echo "GIT_REPO not found!"
    exit 1
fi

GIT_COMMAND=${GIT_COMMAND}" https://${GIT_USERNAME}:${GIT_PERSONAL_TOKEN}@${GIT_REPO}"

${GIT_COMMAND} /app

cd /app

npm install — silent
exec npm run build