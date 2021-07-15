#!/bin/bash

pre_install () {
	echo "Enable network time"
	timedatectl set-ntp true
}

echo "Performing pre install tasks..."
pre_install
echo "Done"
