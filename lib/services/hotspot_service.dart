import 'package:wifi_iot/wifi_iot.dart';

class HotspotService {
  static Future<bool> startLocalOnlyHotspot() async {
    try {
      return await WiFiForIoTPlugin.startLocalOnlyHotspot();
    } catch (e) {
      return false;
    }
  }

  static Future<void> stopLocalOnlyHotspot() async {
    await WiFiForIoTPlugin.stopLocalOnlyHotspot();
  }
}