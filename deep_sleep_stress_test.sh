#!/bin/sh

# This script turn the device screen on, wait 1 second, turn the screen off, wait 30 seconds, and repeat
# It is meant to trigger deep sleep ingress and egress
# As it uses adb over wifi, the device can enter deep sleep in the 30 seconds timeout

###
# Instructions

## Device setup
# From an adb shell, enable adb over wifi:
# $ adb shell
# # su
# # setprop persist.adb.tcp.port 5555
# # reboot

# After the reboot, connect the device to wifi and take note of the IP address

# Disconnect any USB cable from the device, turn off the display of the phone and run the script
# The script works only on linux

###

device_ip=192.168.1.221

i=0
while true ; do adb connect $device_ip:5555 ;i=$((i+1));  echo $i ;sleep 2; adb shell input keyevent POWER; sleep 1 ; adb shell input keyevent POWER; adb disconnect  $device_ip:5555; sleep 30;done
