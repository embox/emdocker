#!/bin/sh

# This uses https://github.com/goldmann/docker-squash

NEWTAG=${1:-embox/emdocker:latest}
TAG=${2:-my-emdocker}

FROM=$(docker history $TAG | grep "MAINTAINER" | head -n 1 | awk '{print $1}')
docker-squash -f $FROM -t $NEWTAG --tmp-dir $PWD/tmp $TAG
