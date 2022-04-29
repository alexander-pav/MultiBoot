#!/bin/sh
# Run from host (phone root required)

adb push ../boot/. /sdcard/multiboot/boot
adb push . /sdcard/multiboot/
adb shell "su -c 'cp /sdcard/multiboot/*.sh /data/data/com.termux/files/home/.shortcuts/;chmod 777 /data/data/com.termux/files/home/.shortcuts/*.sh'" #TODO: chmod +x


#/data/data/com.termux/files/home

# FIXME: Backup boot partition without TWRP
# adb shell "su -c 'dd if=/dev/block/by-name/boot of=/sdcard/multiboot/boot/android_boot.img'"
# adb pull /sdcard/multiboot/boot/android_boot.img  ../boot/
