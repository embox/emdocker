# emdocker
Docker build and test environment

## Use
Please refer to embox wiki: https://github.com/embox/embox/wiki/Emdocker

## Build
Build step is not required for regular usage, it's dedicated to image developers. If you want to develop/extend this image, you can clone this repo, adjust `Dockerfile` and build your own image with next command
```
docker build -t my-emdocker .
```

### Publish
The command above will create image suitable to use, but not so good to be published because it's size. During time of development it became really uncomfortable to watch on layers size, manually squashing them. So external tool for squashing used:  https://github.com/goldmann/docker-squash

For regular use, consider using `squash.sh`. It will squash all layers from source image starting from head and ending at first `MAINTAINER` layer, so base images will be safe. Old image will be untouched, squashed image will get own tag. Synopsis is
```
$ ./squash.sh [NEW-SQUASHED-IMG-TAG [SOURCE-IMG-TO-SQUASH]]
```

Defaults are OK to construct real image, published on https://hub.docker.com/r/embox/emdocker: default source image is `my-emdocker` and squashed image tag is `embox/emdocker:latest`.

If you've built `my-emdocker` and willing to republish `embox/emdocker`, then just type

```
$ ./squash.sh
$ docker push embox/emdocker:latest
```

Note that unsquashed image is still published as `embox/emdocker:latest-dev` via Docker Hub automated build capabillity.

## Details
Image have some tricks to make build and debug embox pleasure.

1. embox root directory passed as `/embox` mount, allowing to edit files via prefered way on host computer. However, new files created by build process should like as it were created on host. Container's user created on container start, taking uid/gid from `embox` mountpoint. So new files created by build process have same uid/gid, as host user.
2. user's bashrc makes `cd` to embox project directory. So, `ssh` or `docker exec` commands have less to type.
