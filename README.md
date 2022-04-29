# Multi Boot PostmarketOS + Android + Windows Poco F1 (64GB version) Step by step Instruction

# https://youtu.be/gOMUqic2Fwk

# WARNING! YOU CAN BRICK YOUR PHONE! USE IT AT YOUR OWN RISK!


Boot TWRP recovery

Download parted for android https://pwdx.lanzoux.com/iUgSEmkrlmh 

Copy parted to the phone 
```
adb push parted /sdcard/
adb shell
```

Move parted to sbin directory
```
cp /sdcard/parted /sbin/ && chmod 755 /sbin/parted
parted /dev/block/sda
```

# Stock partitions 
![Screenshot from 2022-04-27 16-31-10](https://user-images.githubusercontent.com/19728262/165509361-a32c0de3-73c6-426b-ade5-908bb1a94b8d.png)

Delete userdata
```
rm 21
```

Create new partitions
```
mkpart esp fat32 1611MB 1900MB
mkpart userdata ext4 1900MB 25GB
mkpart win ntfs 25GB 50GB 
mkpart lnx ext4 50GB 58.1GB
mkpart pe fat32 58.1GB 59.1GB
set 21 esp on
```


# Modified partitions

![Screenshot from 2022-04-27 16-32-38](https://user-images.githubusercontent.com/19728262/165509440-9f1c820e-efa5-4fb2-a2f5-8b6e79412918.png)


Reboot to TWRP 


Format partions
```
mkfs.fat -F32 -s1 /dev/block/by-name/esp
mkfs.ntfs -f /dev/block/by-name/win

mke2fs -t ext4 /dev/block/by-name/userdata

mke2fs -t ext4 /dev/block/by-name/lnx

mkfs.fat -F32 -s1 /dev/block/by-name/pe
```

Reboot 


# INSTALL ANDROID POSTMARKETOS WINDOWS
1. Android on userdata partition (https://wiki.lineageos.org/devices/beryllium/install)
2. Windows on win partition (https://renegade-project.org/#/en/windows/Installation-guide)
3. PostmarketOS on lnx partition (https://wiki.postmarketos.org/wiki/Xiaomi_Poco_F1_(xiaomi-beryllium)
pmbootstrap flasher flash_rootfs --partition lnx

Root android then backup boot partition from TWRP and copy it to the boot directory as android_boot.img

Copy boot files as (android_boot.img, postmarketos_boot.img and windows_boot.img) into boot dir


# Android (root required)
1. Install TERMUX & TERMUX WIDGETS (FDROID)
2. Run from host computer 
```
cd android
install.sh
```
3. Create termux widgets (windows.sh, pmos.sh)

# PostmarketOS
Copy instalation files to postmarketos and run
```
cd linux
sudo ./install.sh
```

# Windows 
# WARNING! CHECK IF YOUR BOOT PARTITION AT \\?\Device\Harddisk4\Partition45

Download dd for Windows http://www.chrysocome.net/downloads/ddrelease64.exe copy to windows dir

Copy instalation files to windows and run
```
cd windows

As administrator
install.bat 
```

