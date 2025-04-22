import 'package:flutter/material.dart';
import 'package:noise_generation/noise_generation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noise Generator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NoiseHomePage(),
    );
  }
}

class NoiseHomePage extends StatelessWidget {
  const NoiseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Noise Generator Example')),
      body: Center(child: NoiseBox()),
    );
  }
}
