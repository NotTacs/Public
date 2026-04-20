@echo off
title Ultra Hardware Serial Checker
color 0a
setlocal enabledelayedexpansion

:loop
cls
echo ==========================================
echo        ULTRA HARDWARE SERIAL CHECK
echo ==========================================
echo.

echo CPU ID:
powershell -command "(Get-CimInstance Win32_Processor).ProcessorId"
echo.

echo BIOS SERIAL:
powershell -command "(Get-CimInstance Win32_BIOS).SerialNumber"
echo.

echo SYSTEM UUID:
powershell -command "(Get-CimInstance Win32_ComputerSystemProduct).UUID"
echo.

echo BASEBOARD SERIAL:
powershell -command "(Get-CimInstance Win32_BaseBoard).SerialNumber"
echo.

echo DISK SERIALS:
powershell -command "Get-CimInstance Win32_PhysicalMedia | Select -ExpandProperty SerialNumber"
echo.

echo RAM SERIALS:
powershell -command "Get-CimInstance Win32_PhysicalMemory | Select -ExpandProperty SerialNumber"
echo.

echo GPU:
powershell -command "(Get-CimInstance Win32_VideoController).Name"
echo.

echo MAC ADDRESSES:
powershell -command "Get-CimInstance Win32_NetworkAdapter | where {$_.MACAddress} | Select -ExpandProperty MACAddress"
echo.

echo SYSTEM PRODUCT:
powershell -command "(Get-CimInstance Win32_ComputerSystemProduct).Name"
echo.

echo ==========================================
echo Press ENTER to refresh
pause >nul
goto loop