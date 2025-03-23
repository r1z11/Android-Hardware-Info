@echo off
echo Checking device information...
adb start-server

:: Get real model and manufacturer
echo Real Model:
adb shell getprop ro.product.model
echo Manufacturer:
adb shell getprop ro.product.manufacturer

:: Get CPU info
echo CPU Info:
adb shell cat /proc/cpuinfo | findstr "Hardware Processor"

:: Get GPU info
echo GPU Info:
adb shell cat /proc/gpuinfo || echo GPU info not found, may be hidden.

:: Get RAM details
echo RAM Info:
adb shell cat /proc/meminfo | findstr "MemTotal"

:: Get storage details
echo Storage Info:
adb shell df -h | findstr /C:"/data" /C:"/system" /C:"/sdcard"

:: Check real display resolution
echo Display Info:
adb shell wm size

:: Check battery info
echo Battery Info:
adb shell dumpsys battery | findstr /C:"level" /C:"health" /C:"temperature"

:: Check IMEI
echo IMEI:
adb shell service call iphonesubinfo 1 | findstr "000000000000000"

:: Check sensors
echo Available Sensors:
adb shell dumpsys sensorservice | findstr "Sensor"

:: Check for root access
echo Checking Root Access:
adb shell which su || echo No root access detected.

echo Hardware verification complete!
pause
