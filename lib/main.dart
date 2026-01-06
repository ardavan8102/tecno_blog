import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecno_blog/core/routes/app_pages.dart';
import 'package:tecno_blog/core/styles/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Localizations
      locale: const Locale('fa', 'IR'),
      fallbackLocale: const Locale('fa', 'IR'),

      title: 'Tecno Blog',
      theme: AppTheme.mainTheme,

      // Initializing Pages from : consts/app_pages.dart
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}