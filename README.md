# emdocker
Docker build and test environment
## Run
To run this image, you should install `docker` and run next command. No additional actions required, this repo may not be cloned.
```
docker run \
  --privileged \
  -v PATH/TO/EMBOX/ROOT:/embox \
  -P \
  -d embox/emdocker
```

`--privileged` used to pass capabilities for tuntap, kvm and mount-bind capabillity.

`PATH/TO/EMBOX/ROOT` is path to your embox copy. You're supposed to edit files and make commits/pushes there.

## Build
Build step is not required for regular usage, it's dedicated to image developers. If you want to develop/extend this image, you can clone this repo and build your own image with next command
```
docker build -t my-emdocker .
```
Then you should adjust `Dockerfile` with required actions.

## Details
Image have some hacks to make build and debug embox pleasure.
1. embox root directory passed as `/embox` mount. It build embox right there, so ownership of new files should match owner of embox. That's why new user `user` created on container start, his uid/pid assigned from `embox` mountpoint.
2. gdbwrapper provided to recreate host path to embox project in container. That's will make gdb print file path to as host expects, without transformation. Gdb tries to follow symbolic links and report real names, that's why mount-bind used. Also, it stores gdb pid to known place, so host will be able to send signals to it via `killgdbwrapper`.
3. user makes `cd` to embox project directory. So, `ssh` or `docker exec` commands have less to type.
