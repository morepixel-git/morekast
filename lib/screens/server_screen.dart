import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../services/hotspot_service.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  String? ssid;
  String? ip;
  bool isHotspotOn = false;

  Future<void> _startHotspot() async {
    final success = await HotspotService.startLocalOnlyHotspot();
    if (success) {
      setState(() {
        isHotspotOn = true;
        ssid = 'MoreKast-Hotspot';
        ip = '192.168.49.1';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mode Serveur')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: isHotspotOn ? null : _startHotspot,
              child: const Text('Démarrer LocalOnlyHotspot'),
            ),
            if (isHotspotOn) ...[
              const SizedBox(height: 20),
              Text('SSID: $ssid'),
              Text('IP: $ip'),
              QrImageView(data: ip ?? ''),
            ],
          ],
        ),
      ),
    );
  }
}