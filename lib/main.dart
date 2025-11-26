import 'package:flutter/material.dart';
import 'package:tecno_blog/consts/app_theme.dart';
import 'package:tecno_blog/ui/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tecno Blog',
      theme: AppTheme.mainTheme,
      home: const SplashScreen(),
    );
  }
}