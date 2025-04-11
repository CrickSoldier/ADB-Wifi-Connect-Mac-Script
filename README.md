# 📱 ADB Wi-Fi Connect Script for macOS

Easily connect your Android device to ADB over Wi-Fi using this interactive shell script — no more typing long IP addresses or struggling with multiple devices. Also launches `scrcpy` for wireless screen mirroring!

---

## ✅ Features

- Lists connected devices and lets you choose using number keys
- Automatically retrieves your device's IP address
- Enables ADB over Wi-Fi (`tcpip 5555`)
- Connects wirelessly without needing USB after initial setup
- Launches `scrcpy` for screen mirroring

---

## 📦 Prerequisites

Make sure the following tools are installed on your macOS system:

### 🔧 Install ADB (Android Platform Tools)
```bash
brew install android-platform-tools
```

### 🔧 Install `scrcpy` (for screen mirroring)
```bash
brew install scrcpy
```

### ✅ Enable Developer Options on your Android phone

1. Go to **Settings > About phone**
2. Tap **Build number** 7 times to enable Developer Mode
3. Go to **Settings > Developer options**
4. Enable **USB debugging**
5. Connect your device via **USB** at least once

---

## 🚀 Installation

1. Clone or download this script:
```bash
git clone https://github.com/yourusername/adb-wifi-connect.git
cd adb-wifi-connect
```

2. Make the script executable:
```bash
chmod +x adb-wifi-connect.sh
```

---

## ▶️ Usage

1. Plug your phone in via **USB**
2. Run the script:
```bash
./adb-wifi-connect.sh
```
3. Follow the on-screen instructions to select your device
4. Once connected, it will:
   - Restart ADB in TCP mode
   - Connect to your phone over Wi-Fi
   - Launch `scrcpy` for mirroring

✅ You can now unplug your USB cable — the connection is wireless!

---

## 🧯 Troubleshooting

- **"Permission denied" when connecting**:
  - Make sure your device and Mac are on the **same Wi-Fi network**
  - Ensure port **5555** is not blocked by a firewall

- **"Could not detect IP"**:
  - Confirm your device is connected via USB
  - Ensure Wi-Fi is turned on
  - Try reconnecting the device or using a different cable

- **Device not listed**:
  - Run `adb devices` to check if it's detected
  - Authorize USB debugging on your phone if prompted

---

## 🙌 Credits

- Based on [scrcpy](https://github.com/Genymobile/scrcpy) by Genymobile
- ADB Platform Tools by Google
- macOS-compatible improvements by [yourname]

---

## 📜 License

MIT License. Use freely, modify, and share!
