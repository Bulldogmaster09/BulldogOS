#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -x rootfs/bin/busybox ]; then
    echo "ERRO: BusyBox ausente; não é possível empacotar o rootfs."
    exit 1
fi

tar -czf bulldog-rootfs.tar.gz -C rootfs .
echo "Arquivo criado: bulldog-rootfs.tar.gz"
echo "ATENÇÃO: é um arquivo do rootfs, não uma imagem inicializável."
