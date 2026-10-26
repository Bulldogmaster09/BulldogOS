# Bulldog OS

Minimal Linux userspace for LEGO Mindstorms EV3.

Target:
- ARM926EJ-S / ARMv5
- 64 MB RAM
- FAT32 boot partition
- EXT4 root filesystem

Build flow:
1. Cross-compile BusyBox with `arm-linux-gnueabi-`
2. Install BusyBox into `rootfs/`
3. Add EV3 kernel, DTB, boot script and modules
4. Build the SD-card image

This repository does not contain proprietary or generated binaries by default.
