#!/bin/bash

ROOT_PARTITION=/dev/sda2
BOOT_MNT=/boot

ARCH_CONF=$BOOT_MNT/loader/entries/arch.conf
LOADER_CONF=$BOOT_MNT/loader/loader.conf

echo "Installing bootloader..."
bootctl install

echp "Setting config"
echo "title	Arch Linux" > $ARCH_CONF
echo "linux	/vmlinuz-linux" >> $ARCH_CONF
echo "initrd	/initramfs-linux.img" >> $ARCH_CONF
echo "options	root=\"UUID=$(blkid $ROOT_PARTITION -s UUID -o value)\" rw" >> $ARCH_CONF

echo "Enabling config"
echo "default arch.conf" > $LOADER_CONF
