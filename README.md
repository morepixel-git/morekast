# MoreKast — Multiroom Audio Portable (WiFi Local Only)

Application Flutter pour système multiroom audio **100% portable** avec LocalOnlyHotspot Android.

## Prérequis

### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev libstdc++-12-dev liblzma-dev libblkid1 libglu1-mesa libsecret-1-dev libjsoncpp-dev curl git unzip xz-utils zip android-sdk-platform-tools rpm patchelf
```

### Flutter
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

**Android**
```bash
flutter build apk --release
```

**Linux**
```bash
flutter build linux --release
```

**Permissions Android** : voir AndroidManifest.xml

## Structure
- lib/screens/server_screen.dart
- lib/services/hotspot_service.dart
- etc.

Prêt pour tests !