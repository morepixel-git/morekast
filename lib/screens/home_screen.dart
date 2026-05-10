import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MoreKast - Multiroom')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to Server Screen
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Placeholder()));
              },
              child: const Text('Je suis le Serveur (Hotspot)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to Client Screen
                Navigator.push(context, MaterialPageRoute(builder: (_) => const Placeholder()));
              },
              child: const Text('Je suis un Client'),
            ),
          ],
        ),
      ),
    );
  }
}