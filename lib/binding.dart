import 'package:get/get.dart';
import 'package:tecno_blog/core/controller/article/article_management_controller.dart';
import 'package:tecno_blog/core/controller/article/article_single_page_controller.dart';
import 'package:tecno_blog/core/controller/article/list_article_controller.dart';
import 'package:tecno_blog/core/controller/file_pick_controller.dart';
import 'package:tecno_blog/core/controller/home_controller.dart';
import 'package:tecno_blog/core/controller/register_controller.dart';
import 'package:tecno_blog/core/controller/small_controllers/bookmarked_controller.dart';
import 'package:tecno_blog/core/controller/small_controllers/page_handler_controller.dart';


class ArticleSingleBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ArticleSinglePageController());
    Get.lazyPut(() => BookmarkedController());
    Get.lazyPut(() => ArticleManagementController());
  }

}

class PageHandlerBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(PageHandlerController());
    Get.lazyPut(() => ListArticleController(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
  }

}

class ArticleManagementBinding implements Bindings {

  @override
  void dependencies() {
    Get.put(ArticleManagementController());
    Get.put(FilePickController());
  }

}