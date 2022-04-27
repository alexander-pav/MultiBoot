@echo off

echo "CHECK IF YOUR BOOT PARTITION AT \\?\Device\Harddisk4\Partition45 !!! PLEASE CHECK CAREFULLY!!! YOU CAN BRICK YOUR PHONE!!! USE IT AT YOR OWN RISK!!!"

:: TODO: Automatically detect boot partition path
::C:\multiboot\ddrelease64.exe --list

%SystemDrive%\multiboot\ddrelease64.exe if=%SystemDrive%\multiboot\boot\android_boot.img of=\\?\Device\Harddisk4\Partition45 bs=1M
shutdown.exe /r -t 2
