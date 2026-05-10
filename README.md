# MoreKast — Multiroom Audio Portable (WiFi Local Only)

**Application Flutter** pour créer un système multiroom audio **100% portable** sans routeur WiFi :
- Un téléphone Android crée un **LocalOnlyHotspot**
- Les autres appareils (Android + Windows + Linux) se connectent et jouent le son en synchro

## Prérequis

### 1. Paquets système Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install -y \
  clang cmake ninja-build pkg-config \
  libgtk-3-dev libstdc++-12-dev liblzma-dev libblkid1 \
  libglu1-mesa libsecret-1-dev libjsoncpp-dev \
  curl git unzip xz-utils zip \
  android-sdk-platform-tools rpm patchelf
```

### 2. Flutter
```bash
sudo snap install flutter --classic
flutter doctor
flutter config --enable-android --enable-linux-desktop
flutter doctor --android-licenses
```

## Installation

```bash
git clone https://github.com/morepixel-git/morekast.git
cd morekast
flutter pub get
```

## Build

### Android
```bash
flutter build apk --release
```

### Linux
```bash
flutter build linux --release
```

### Windows
```bash
flutter build windows --release
```

## Roadmap
- Écran Client + scan QR
- Player audio complet
- Foreground Service
- Snapcast intégration

**Prêt à coder !** 🚀