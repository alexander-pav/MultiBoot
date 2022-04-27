#!/bin/sh
# Run from host (phone root required)

adb push ../boot/. /sdcard/multiboot/boot
adb push . /sdcard/multiboot/
adb shell "su -c 'cp /sdcard/multiboot/*.sh /data/data/com.termux/files/home/.shortcuts/;chmod 777 /data/data/com.termux/files/home/.shortcuts/*.sh'" #TODO: chmod +x


#/data/data/com.termux/files/home
