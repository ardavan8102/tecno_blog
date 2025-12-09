import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/consts/assets.dart';
import 'package:tecno_blog/consts/colors.dart';
import 'package:tecno_blog/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((value) {
      Get.offAndToNamed(AppRoutes.pageHandler);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppSolidColors.scaffoldBG,
      body: SafeArea(
        child: Center(
          child: splashContent(),
        ),
      ),
    );
  }

  // Content
  Column splashContent() {
    return Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .center,
      children: [
        Image.asset(AppAssets.logoWithText),
        SpinKitWave(
          color: AppSolidColors.primary,
          size: 50.0,
        ),
      ],
    );
  }
}