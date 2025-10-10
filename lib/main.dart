import 'package:flutter/material.dart';
import 'src/features/home/ui/home_screen.dart';

void main() {
  runApp(const ArchitecturePatternsApp());
}

class ArchitecturePatternsApp extends StatelessWidget {
  const ArchitecturePatternsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Архитектурные паттерны',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
