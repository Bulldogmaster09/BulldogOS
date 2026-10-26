ROOTFS := $(CURDIR)/rootfs

.PHONY: all busybox rootfs image clean

all: rootfs

busybox:
	./scripts/build-busybox.sh

rootfs:
	./scripts/build-rootfs.sh

image:
	./scripts/make-image.sh

clean:
	rm -rf $(ROOTFS)/bin/* $(ROOTFS)/sbin/* $(ROOTFS)/usr
