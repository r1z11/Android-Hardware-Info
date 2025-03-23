#!/bin/bash

echo "Checking device information..."
adb start-server

# Get real model and manufacturer
echo "Real Model: $(adb shell getprop ro.product.model)"
echo "Manufacturer: $(adb shell getprop ro.product.manufacturer)"

# Get CPU info (Bypasses software spoofing)
echo "CPU Info:"
adb shell cat /proc/cpuinfo | grep -E 'Hardware|Processor'

# Get GPU info
echo "GPU Info:"
adb shell cat /proc/gpuinfo || echo "GPU info not found, may be hidden."

# Get RAM details
echo "RAM Info:"
adb shell cat /proc/meminfo | grep MemTotal

# Get storage details
echo "Storage Info:"
adb shell df -h | grep -E '/data|/system|/sdcard'

# Check real display resolution
echo "Display Info:"
adb shell wm size

# Check battery info
echo "Battery Info:"
adb shell dumpsys battery | grep -E 'level|health|temperature'

# Check IMEI
echo "IMEI:"
adb shell service call iphonesubinfo 1 | cut -c 52-66 | tr -d '.[:space:]'

# Check sensors (fake phones often have missing sensors)
echo "Available Sensors:"
adb shell dumpsys sensorservice | grep "Sensor" | cut -d ":" -f 1

# Check for root access (some fake phones are pre-rooted)
echo "Checking Root Access:"
adb shell which su || echo "No root access detected."

echo "Hardware verification complete!"
