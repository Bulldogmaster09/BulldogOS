ROOTFS := $(CURDIR)/rootfs

.PHONY: all busybox rootfs image clean

all: rootfs

busybox:
	./scripts/build-busybox.sh

rootfs: busybox
	./scripts/build-rootfs.sh

image: rootfs
	./scripts/make-image.sh

clean:
	@echo "Limpeza desativada por segurança."
	@echo "Nenhum arquivo foi removido."
