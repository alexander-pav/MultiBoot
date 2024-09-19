# Instruction to make Multi Boot on Pocophone F1 Linux + Android + Windows
# https://youtu.be/gOMUqic2Fwk

This instuction for (64GB version)!
# WARNING! YOU CAN BRICK YOUR PHONE! USE IT AT YOUR OWN RISK!

# PARTITIONING
For partitioning we need to Boot the phone from TWRP recovery

So first of all we need to copy parted for android (https://pwdx.lanzoux.com/iUgSEmkrlmh) to the phone's sbin directory 
```
# host
adb push parted /sdcard/
adb shell

# phone
cp /sdcard/parted /sbin/ && chmod 755 /sbin/parted
```

# Stock partitions should look like this
![Screenshot from 2022-04-27 16-31-10](https://user-images.githubusercontent.com/19728262/165509361-a32c0de3-73c6-426b-ade5-908bb1a94b8d.png)

Next, we need to remove userdata partition and create new partitions

```
/sbin/parted /dev/block/sda
rm 21
mkpart esp fat32 1611MB 1900MB
mkpart userdata ext4 1900MB 25GB
mkpart win ntfs 25GB 50GB 
mkpart lnx ext4 50GB 58.1GB
mkpart pe fat32 58.1GB 59.1GB
set 21 esp on
```


# Modified partitions should look like this
![Screenshot from 2022-04-27 16-32-38](https://user-images.githubusercontent.com/19728262/165509440-9f1c820e-efa5-4fb2-a2f5-8b6e79412918.png)


Next, we need to reboot the phone to TWRP again

Format created partions
```
mkfs.fat -F32 -s1 /dev/block/by-name/esp
mkfs.ntfs -f /dev/block/by-name/win
mke2fs -t ext4 /dev/block/by-name/userdata
mke2fs -t ext4 /dev/block/by-name/lnx
mkfs.fat -F32 -s1 /dev/block/by-name/pe
```

Reboot 


# OS INSTALATIONS
# To install OSes follow the guides bellow
1. Android on userdata partition (https://wiki.lineageos.org/devices/beryllium/install)
2. Windows on win partition (https://renegade-project.org/#/en/windows/Installation-guide)
3. PostmarketOS on lnx partition (https://wiki.postmarketos.org/wiki/Xiaomi_Poco_F1_(xiaomi-beryllium)
pmbootstrap flasher flash_rootfs --partition lnx

Rename the boot files as (android_boot.img, postmarketos_boot.img and windows_boot.img) and put them at boot dir


# OS SWITCHES

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
# WARNING! CHECK IF YOUR BOOT PARTITION AT 
# \\?\Device\Harddisk4\Partition45

Download dd for Windows http://www.chrysocome.net/downloads/ddrelease64.exe copy to windows dir

Copy instalation files to windows and run
```
cd windows

As administrator
install.bat 
```

