#!/bin/sh

mkdir -p /usr/share/multiboot
cp * /usr/share/multiboot/
cp -r ../boot /usr/share/multiboot/
cp *.desktop /usr/share/applications/
chmod 644 /usr/share/applications/*.desktop
chmod 755 /usr/share/multiboot/*.sh
chmod 644 /usr/share/multiboot/*.svg

echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD: /usr/share/multiboot/android.sh" > /etc/sudoers.d/multiboot
echo "$SUDO_USER ALL=(ALL:ALL) NOPASSWD: /usr/share/multiboot/windows.sh" >> /etc/sudoers.d/multiboot 
