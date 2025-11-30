import 'package:get/get.dart';
import 'package:tecno_blog/page_handler.dart';
import 'package:tecno_blog/view/main/about_us.dart';
import 'package:tecno_blog/view/splash.dart';

class AppRoutes {
  static const splash = '/';
  static const home = '/page-handler';
  static const aboutUs = '/about-us';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(), 
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => PageHandler(), 
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => AboutUsPage(), 
    ),
  ];
}