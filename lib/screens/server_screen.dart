import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wifi_iot/wifi_iot.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  String? ssid;
  String? password;
  String ipAddress = '192.168.49.1';
  final List<String> connectedClients = [];

  Future<void> startHotspot() async {
    try {
      final success = await WiFiForIoTPlugin.startLocalOnlyHotspot();
      if (success) {
        setState(() {
          ssid = 'MoreKast-${DateTime.now().millisecond}';
          password = 'morekast123';
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hotspot démarré !')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MoreKast - Mode Serveur')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.wifi),
              label: const Text('Démarrer Hotspot'),
              onPressed: startHotspot,
            ),
            if (ssid != null) ...[
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('SSID: $ssid', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Password: $password'),
                      Text('IP Serveur: $ipAddress'),
                      const SizedBox(height: 16),
                      QrImageView(data: '$ipAddress:1705', size: 220),
                    ],
                  ),
                ),
              ),
            ],
            const SizedBox(height: 24),
            const Text('Clients connectés', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: connectedClients.length,
                itemBuilder: (_, i) => ListTile(title: Text(connectedClients[i])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}