#!/bin/bash

set -e

cd $CONTEXT_DIR
rm /tmp/build_args || echo OK
env >/tmp/build_args
echo "--build-arg \""$(cat /tmp/build_args | sed -z 's/\n/" --build-arg "/g')"IGNORE_VAR=IGNORE_VAR\"" >/tmp/build_args
BUILD_ARGS=$(cat /tmp/build_args)
COMMAND="docker build -t $FULL_IMAGE_NAME -t $IMAGE_NAME:latest -f $DOCKERFILE $BUILD_ARGS --no-cache ."
/bin/bash -c "$COMMAND"
echo $IMAGE_NAME
docker push $IMAGE_NAME:latest
docker push $FULL_IMAGE_NAME
