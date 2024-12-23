#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/retlyos.kernel isodir/boot/retlyos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "retlyos" {
	multiboot /boot/retlyos.kernel
}
EOF
grub-mkrescue -o retlyos.iso isodir
