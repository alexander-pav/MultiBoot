@echo off

echo "CHECK IF YOUR BOOT PARTITION AT \\?\Device\Harddisk4\Partition45 !!! PLEASE CHECK CAREFULLY!!! YOU CAN BRICK YOUR PHONE!!! USE IT AT YOR OWN RISK!!!"
echo "PRESS ANY KEY TO INSTALL OR CTRL+C IF YOU ARENT SURE"
pause

echo  %SystemDrive% 
if not exist "%SystemDrive%\multiboot\" mkdir %SystemDrive%\multiboot
if not exist "%SystemDrive%\multiboot\boot\" mkdir %SystemDrive%\multiboot\boot
cd /D %~dp0%
copy * %SystemDrive%\multiboot\
copy ..\boot\* %SystemDrive%\multiboot\boot\
copy %SystemDrive%\multiboot\*.lnk %USERPROFILE%\Desktop\


pause
