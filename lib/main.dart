import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/app_pages.dart';
import 'package:tecno_blog/consts/app_theme.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Localizations : A & B Notes Are needed for GetMaterialApp
      locale: const Locale('fa', 'IR'), // NOTE A
      fallbackLocale: const Locale('fa', 'IR'), // NOTE B
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'), // Farsi
      ],

      title: 'Tecno Blog',
      theme: AppTheme.mainTheme,

      // Initializing Pages from : consts/app_pages.dart
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}