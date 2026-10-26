#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

CROSS=arm-linux-gnueabi-
SRC="$PWD/build/busybox"
ROOTFS="$PWD/rootfs"

command -v "${CROSS}gcc" >/dev/null
command -v make >/dev/null

if [ ! -f "$SRC/Makefile" ]; then
    echo "ERRO: código-fonte do BusyBox não encontrado."
    exit 1
fi

cd "$SRC"

# Gerar configuração padrão somente se ainda não existir.
if [ ! -f .config ]; then
    make ARCH=arm CROSS_COMPILE="$CROSS" defconfig
fi

# Compilar sem executar olddefconfig.
make -j2 ARCH=arm CROSS_COMPILE="$CROSS"

# Instalar o BusyBox no rootfs.
make CONFIG_PREFIX="$ROOTFS" install

echo "BusyBox compilado e instalado."
