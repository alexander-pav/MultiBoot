#!/bin/sh

dd if=/usr/share/multiboot/boot/windows_boot.img of=/dev/disk/by-partlabel/boot
sleep 1
/sbin/reboot
