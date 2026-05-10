import 'package:wifi_iot/wifi_iot.dart';

class HotspotService {
  static Future<bool> startLocalOnlyHotspot() async {
    try {
      final success = await WiFiForIoTPlugin.startLocalOnlyHotspot();
      if (success) {
        print('LocalOnlyHotspot démarré');
      }
      return success;
    } catch (e) {
      print('Erreur hotspot: $e');
      return false;
    }
  }

  static Future<void> stopLocalOnlyHotspot() async {
    await WiFiForIoTPlugin.stopLocalOnlyHotspot();
  }
}