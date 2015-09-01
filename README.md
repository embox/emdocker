# emdocker
Docker build and test environment
## Build
```
docker build -t my-emdocker .
```
## Run
```
docker run \
  --privileged=true
  --net=host \
  -v PATH/TO/EMBOX/ROOT:/embox 
  -it antonkozlov/emdocker
```

`--privileged=true` used to pass capabilities for tuntap and kvm.

`--net=host` embeds container into host network stack, so host will be able interact with qemu network directly.

`PATH/TO/EMBOX/ROOT` is path to your embox copy. You're supposed to edit files and make commits/pushes there.
