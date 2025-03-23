# Android Hardware Info
 Bypass spoofed android hardware information and get true values

## What This Script Does:

    1. Extracts real CPU, GPU, RAM, storage, and IMEI details.
    2. Bypasses software spoofed model names using /proc and adb shell.
    3. Detects fake sensors or missing components.
    4. Checks for pre-installed root access (common in fake/cloned phones).

# Steps to Use:

    1. Enable USB Debugging on your Android device.
    2. Install ADB on your PC (if not installed).
        Windows: Download from here. https://developer.android.com/tools/adb
        macOS/Linux: Install via terminal using (macOS) 
```sh 
brew install android-platform-tools
```
or (Linux).
```sh
sudo apt install adb
```
    3. Connect your phone via USB and allow debugging.
    4. Run the script on your PC. check_android_hardware.sh (Linux/macOS) or check_android_hardware.bat (Windows).

# Linux/MacOS

```sh 
chmod +x check_android_hardware.sh
./check_android_hardware.sh
```

# Expected Results (Example)

On a real Android phone, output might look like:

    Real Model: SM-G991B
    Manufacturer: Samsung
    CPU Info: Hardware : Exynos 2100
    GPU Info: Mali-G78 MP14
    RAM Info: MemTotal: 7972000 kB
    Storage Info: /data 112G /system 15G
    Display Info: 2400x1080
    Battery Info: Level: 89, Health: Good, Temp: 32°C
    IMEI: 356789123456789
    Available Sensors: Proximity, Gyroscope, Accelerometer
    Checking Root Access: No root access detected.

# Red Flags (If Fake Phone)

    CPU shows "MT6580" but the phone claims to have a Snapdragon 888 (fake).
    GPU info missing or shows "unknown" (fake software overlay).
    RAM shows "2048 MB" but the phone claims to have 8GB RAM.
    IMEI is missing or mismatched with the phone’s sticker/box.
    Sensors missing (Fake phones lack a gyroscope or accelerometer).