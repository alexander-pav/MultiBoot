#!/bin/sh
su -c "dd if=/sdcard/multiboot/boot/postmarketos_boot.img of=/dev/block/by-name/boot;sleep 1;reboot"
