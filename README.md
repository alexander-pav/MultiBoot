# MultiBoot
https://youtu.be/gOMUqic2Fwk

Poco F1 Multiboot Step by step Instruction

# PostmarketOS + Android + Windows on UFS multi boot (DANGEROUS!!! YOU CAN BRICK YOUR PHONE!!! USE IT AT YOUR OWN RISK!!!)
(POCO F1 64GB version)

# Connect USB cable and boot TWRP recovery
# Download parted for android arm64 https://pwdx.lanzoux.com/iUgSEmkrlmh copy to utils
# Copy parted to the phone 
adb push utils/parted /sdcard/
adb shell
# Move parted to sbin directory
cp /sdcard/parted /sbin/ && chmod 755 /sbin/parted
parted /dev/block/sda

# Printing stock partitions 
p

Model: SKhynix H28U74301AMR (scsi)
Disk /dev/block/sda: 59.1GB
Sector size (logical/physical): 4096B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name        Flags
 1      24.6kB  41.0kB  16.4kB               switch
 2      41.0kB  73.7kB  32.8kB               ssd
 3      73.7kB  524kB   451kB                bk01
 4      524kB   786kB   262kB                bk02
 5      786kB   1049kB  262kB                bk03
 6      1049kB  1573kB  524kB                keystore
 7      1573kB  2097kB  524kB                frp
 8      2097kB  4194kB  2097kB               bk04
 9      4194kB  8389kB  4194kB               misc
10      8389kB  16.8MB  8389kB               logfs
11      16.8MB  33.6MB  16.8MB               oops
12      33.6MB  50.3MB  16.8MB               devinfo
13      50.3MB  67.1MB  16.8MB               bk05
14      67.1MB  134MB   67.1MB  ext4         persist
15      134MB   201MB   67.1MB  ext4         persistbak
16      201MB   268MB   67.1MB               logdump
17      268MB   403MB   134MB                minidump
18      403MB   1275MB  872MB   ext4         cust
19      1275MB  1342MB  67.1MB               recovery
20      1342MB  1611MB  268MB   ext4         cache
21      1611MB  59.1GB  57.5GB               userdata

# Split userdata (DANGEROUS!!! YOU CAN BRICK YOUR PHONE!!! REALLY!!!)
rm 21
# Create a partition for Android
mkpart esp fat32 1611MB 1900MB
mkpart userdata ext4 1900MB 25GB
mkpart win ntfs 25GB 50GB 
mkpart lnx ext4 50GB 58.1GB
mkpart pe fat32 58.1GB 59.1GB
set 21 esp on

# Printing modified partitions
p
Number  Start   End     Size    File system  Name        Flags
 1      24.6kB  41.0kB  16.4kB               switch
 2      41.0kB  73.7kB  32.8kB               ssd
 3      73.7kB  524kB   451kB                bk01
 4      524kB   786kB   262kB                bk02
 5      786kB   1049kB  262kB                bk03
 6      1049kB  1573kB  524kB                keystore
 7      1573kB  2097kB  524kB                frp
 8      2097kB  4194kB  2097kB               bk04
 9      4194kB  8389kB  4194kB               misc
10      8389kB  16.8MB  8389kB               logfs
11      16.8MB  33.6MB  16.8MB               oops
12      33.6MB  50.3MB  16.8MB               devinfo
13      50.3MB  67.1MB  16.8MB               bk05
14      67.1MB  134MB   67.1MB  ext4         persist
15      134MB   201MB   67.1MB  ext4         persistbak
16      201MB   268MB   67.1MB               logdump
17      268MB   403MB   134MB                minidump
18      403MB   1275MB  872MB   ext4         cust
19      1275MB  1342MB  67.1MB               recovery
20      1342MB  1611MB  268MB   ext4         cache
21      1611MB  1900MB  289MB   fat32        esp         boot, esp
22      1900MB  25.0GB  23.1GB  ext4         userdata
23      25.0GB  50.0GB  25.0GB  ntfs         win         msftdata
24      50.0GB  58.1GB  8099MB  ext4         lnx
25      58.1GB  59.1GB  964MB   fat32        pe          msftdata

# Quit parted
quit


# Reboot to TWRP again
reboot

adb shell

# Format the partions
mkfs.fat -F32 -s1 /dev/block/by-name/esp
mkfs.ntfs -f /dev/block/by-name/win
mke2fs -t ext4 /dev/block/by-name/userdata
mke2fs -t ext4 /dev/block/by-name/lnx
mkfs.fat -F32 -s1 /dev/block/by-name/pe

# Reboot to TWRP again
reboot

# INSTALL ANDROID POSTMARKETOS WINDOWS
# 1. Android on userdata partition (https://wiki.lineageos.org/devices/beryllium/install)
# 2. Windows on win partition (https://renegade-project.org/#/en/windows/Installation-guide)
# 3. PostmarketOS on lnx partition (https://wiki.postmarketos.org/wiki/Xiaomi_Poco_F1_(xiaomi-beryllium)
# pmbootstrap flasher flash_rootfs --partition lnx  
# OR  fastboot flash lnx postmarketos.img)


# Copy boot files (android_boot.img(rooted), postmarketos_boot.img and windows_boot.img) into MULTI_BOOT/boot

# Flash boot from running OS
# Android (root required)
# 1. Install TERMUX & TERMUX WIDGETS (FDROID)
# 2. From android dir run install.sh
# //2. Copy boot dir to /sdcard/multiboot/boot
# //3. Copy android/*.sh files to /data/data/com.termux/files/home/.shortcuts
# //4. chmod 777 /data/data/com.termux/files/home/.shortcuts/*.sh
# 3. Create termux widgets (windows.sh, pmos.sh)

# PostmarketOS
cd MULTI_BOOT/linux
sudo ./install.sh

# Windows (USE AT YOUR OWN RISK!!! CHECK IF YOUR BOOT PARTITION AT \\?\Device\Harddisk4\Partition45)
# Download dd for Windows http://www.chrysocome.net/downloads/ddrelease64.exe copy to MULTI_BOOT/windows dir
cd MULTI_BOOT/windows
# Run as administrator
install.bat 

