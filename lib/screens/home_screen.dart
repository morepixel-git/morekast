import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MoreKast - Multiroom Portable')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ServerScreen())),
              child: const Text('Je suis le Serveur (Hotspot)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ClientScreen())),
              child: const Text('Je suis un Client'),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder screens
class ServerScreen extends StatelessWidget {
  const ServerScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Server Screen - Hotspot + QR')));
}

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: Text('Client Screen')));
}
