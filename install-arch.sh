#!/bin/bash

BOOT_PARTITION=/dev/sda1
ROOT_PARTITION=/dev/sda2

pre_install () {
	echo "Enable network time"
	timedatectl set-ntp true
}

prepare_partitions () {
	echo "Formatting paritionts..."
	mkfs.fat -F32 $BOOT_PARTITION
	mkfs.ext4 $ROOT_PARTITION
	echo "Mounting partitions..."
	mount $ROOT_PARTITION /mnt
	mkdir /mnt/boot
	mount $BOOT_PARTITION /mnt/boot
}

install_arch () {
	pacstrap /mnt $(cat pacstrap_install)
}

echo "Performing pre install tasks..."
pre_install
echo "Done"

echo "Preparing paritions..."
prepare_partitions
echo "Done"

echo "Pacstrapping packages..."
install_arch
echo "Done"
