#!/bin/sh

dd if=/usr/share/multiboot/boot/android_boot.img of=/dev/disk/by-partlabel/boot
sleep 1
/sbin/reboot
