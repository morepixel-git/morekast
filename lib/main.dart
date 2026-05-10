import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MoreKastApp()));
}

class MoreKastApp extends StatelessWidget {
  const MoreKastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoreKast',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}