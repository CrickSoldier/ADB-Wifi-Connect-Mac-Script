#!/bin/bash

# Get list of connected devices (excluding header)
devices=($(adb devices | awk 'NR>1 && $2=="device" {print $1}'))

# Check for devices
if [ ${#devices[@]} -eq 0 ]; then
  echo "❌ No devices connected via USB. Please connect a device and try again."
  exit 1
fi

# Display numbered list
echo "📱 Available ADB devices:"
for i in "${!devices[@]}"; do
  echo "$((i+1))) ${devices[$i]}"
done

# Choose one
read -p "👉 Choose a device (1-${#devices[@]}): " choice

# Validate
if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ "$choice" -lt 1 ] || [ "$choice" -gt "${#devices[@]}" ]; then
  echo "❌ Invalid selection."
  exit 1
fi

device_id=${devices[$((choice-1))]}
echo "✅ You selected: $device_id"

# Get IP using macOS-compatible tools
echo "🌐 Getting IP address..."
device_ip=$(adb -s "$device_id" shell ip -f inet addr show wlan0 | sed -nE 's/.*inet ([0-9.]+)\/.*/\1/p')

if [ -z "$device_ip" ]; then
  echo "❌ Could not detect IP. Make sure the device is connected via USB and Wi-Fi is enabled."
  exit 1
fi

echo "📶 Device IP: $device_ip"
echo "🔁 Restarting ADB in TCP/IP mode..."
adb -s "$device_id" tcpip 5555

sleep 2

echo "🔗 Connecting to $device_ip:5555..."
adb connect "$device_ip:5555"

echo "✅ Connected wirelessly! Launching scrcpy..."
scrcpy -s "$device_ip:5555"
