# emdocker
Docker build and test environment
## Run
To run this image, you should install `docker` and run next command. No additional actions required, this repo may not be cloned.
```
docker run \
  --privileged=true \
  --net=host \
  -v PATH/TO/EMBOX/ROOT:/embox \
  -it embox/emdocker
```

`--privileged=true` used to pass capabilities for tuntap and kvm.

`--net=host` embeds container into host network stack, so host will be able interact with qemu network directly.

`PATH/TO/EMBOX/ROOT` is path to your embox copy. You're supposed to edit files and make commits/pushes there.

## Build
Build step is not required for regular usage, it's dedicated to image developers. If you want to develop/extend this image, you can clone this repo and build your own image with next command
```
docker build -t my-emdocker .
```
Then you should adjust `Dockerfile` with required actions.
