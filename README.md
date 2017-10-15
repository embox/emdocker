# emdocker
Docker build and test environment

## Use
Please refer to embox wiki: https://github.com/embox/embox/wiki/Emdocker

## Details
Image have some tricks to make build and debug embox pleasure.

1. embox root directory passed as `/embox` mount, allowing to edit files via prefered way on host computer. However, new files created by build process should like as it were created on host. Container's user created on container start, taking uid/gid from `embox` mountpoint. So new files created by build process have same uid/gid, as host user.
2. user's bashrc makes `cd` to embox project directory. So, `ssh` or `docker exec` commands have less to type.

## Build
Build step is not required for regular usage, it's dedicated to image developers. If you want to develop/extend this image, you can clone this repo, adjust `Dockerfile` and build your own image with next command
```
docker build -t embox/emdocker .
```

The new built image will substitude downloaded one under the `embox/emdocker` name, so you can test it without changing any scripts. If it is a problem, specify another name

### Publish
This repo relies on Docker Hub automated build support. It rebuild and publish image under `embox/emdocker` name.

In the past, automated build published under `embox/emdocker:latest-dev`, while `embox/emdocker:latest` held manually built and sqashed image.

Since introducing `embox/emdocker-test` it's easier to keep things simple. If the big layer size will become a problem, see history of this README for instructions on squashing.
