# MoreKast — Multiroom Audio Portable (WiFi Local Only)

Application Flutter pour créer un système **multiroom audio 100% portable** sans routeur WiFi :
- Un téléphone Android crée un **LocalOnlyHotspot**
- Les autres appareils (Android + Windows + Linux) se connectent et jouent le son en synchro

## Table des matières
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Build](#build)
- [Permissions Android](#permissions-android)
- [Structure du projet](#structure-du-projet)
- [Roadmap](#roadmap)

## Prérequis

### 1. Paquets système Linux (Ubuntu/Debian recommandé)
```bash
sudo apt update
sudo apt install -y \
  clang \
  cmake \
  ninja-build \
  pkg-config \
  libgtk-3-dev \
  libstdc++-12-dev \
  liblzma-dev \
  libblkid1 \
  libglu1-mesa \
  libsecret-1-dev \
  libjsoncpp-dev \
  curl git unzip xz-utils zip \
  android-sdk-platform-tools \
  rpm patchelf
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

### Android (APK)
```bash
flutter build apk --release
# Fichier généré : build/app/outputs/flutter-apk/app-release.apk
```

### Linux Desktop
```bash
flutter build linux --release
# Binaire : build/linux/x64/release/bundle/morekast
```

Pour créer un paquet .deb :
```bash
cd build/linux/x64/release/bundle
dpkg-deb --build . morekast_1.0.0_amd64.deb
```

### Windows
```bash
flutter build windows --release
```

## Permissions Android (`android/app/src/main/AndroidManifest.xml`)
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.NEARBY_WIFI_DEVICES" />
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />
<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.WAKE_LOCK" />
```

## Structure du projet
```
lib/
├── main.dart
├── providers/
├── screens/
│   ├── home_screen.dart
│   ├── server_screen.dart
│   └── client_screen.dart
├── services/
│   ├── hotspot_service.dart
│   ├── snapcast_service.dart
│   └── network_service.dart
├── models/
└── utils/
```

## Roadmap
- [ ] Écran Client complet + scan QR code
- [ ] Intégration player audio (`just_audio` + Snapcast client)
- [ ] Foreground Service Android complet
- [ ] Découverte via Google Nearby Connections
- [ ] Support sources audio (fichiers locaux, micro...)
