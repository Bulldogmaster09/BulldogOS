#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
ROOTFS="$PWD/rootfs"

mkdir -p "$ROOTFS"/{dev,proc,sys,tmp,run,mnt,root}
mkdir -p "$ROOTFS"/{bin,sbin,etc,usr/bin,usr/sbin,var,lib}

if [ ! -x "$ROOTFS/bin/busybox" ]; then
    echo "ERRO: BusyBox não foi instalado em rootfs/bin."
    echo "Verifique a compilação antes de continuar."
    exit 1
fi

if [ ! -e "$ROOTFS/bin/sh" ]; then
    ln -s busybox "$ROOTFS/bin/sh"
fi

if [ ! -e "$ROOTFS/sbin/init" ]; then
    ln -s ../bin/busybox "$ROOTFS/sbin/init"
fi

chmod +x "$ROOTFS/etc/init.d/rcS"

echo "Estrutura básica do rootfs preparada."
echo "Isso ainda não comprova que o sistema inicializa no EV3."
