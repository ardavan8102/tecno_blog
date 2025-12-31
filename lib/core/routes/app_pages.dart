import 'package:get/get.dart';
import 'package:tecno_blog/binding.dart';
import 'package:tecno_blog/page_handler.dart';
import 'package:tecno_blog/view/articles/article_list_management.dart';
import 'package:tecno_blog/view/articles/article_single_page.dart';
import 'package:tecno_blog/view/articles/articles_page.dart';
import 'package:tecno_blog/view/articles/manage_article_single.dart';
import 'package:tecno_blog/view/main/about_us.dart';
import 'package:tecno_blog/view/registration/register_intro.dart';
import 'package:tecno_blog/view/splash.dart';

class AppRoutes {
  static const splash = '/splash';
  static const pageHandler = '/page-handler';
  static const aboutUs = '/about-us';
  static const articlesListPage = '/article-list';
  static const articleSinglePlage = '/article-single-page';
  static const registerIntroPage = '/register-intro';
  static const articleListManagement = '/article-manage';
  static const articleSingleManagement = '/single-management';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(), 
    ),

    GetPage(
      name: AppRoutes.pageHandler,
      page: () => PageHandler(),
      binding: PageHandlerBinding(),
    ),

    GetPage(
      name: AppRoutes.aboutUs,
      page: () => AboutUsPage(), 
    ),

    GetPage(
      name: AppRoutes.articlesListPage,
      page: () => ArticlesPage(),
    ),

    GetPage(
      name: AppRoutes.articleSinglePlage,
      page: () => ArticleSinglePage(), 
      binding: ArticleSingleBinding()
    ),

    GetPage(
      name: AppRoutes.registerIntroPage,
      page: () => RegisterIntroPage(), 
    ),

    GetPage(
      name: AppRoutes.articleListManagement,
      page: () => ArticleListManagementPage(),
      binding: ArticleManagementBinding()
    ),

    GetPage(
      name: AppRoutes.articleSingleManagement,
      page: () => ArticleSingleManagementPage(),
    ),
  ];
}