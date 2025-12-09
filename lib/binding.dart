import 'package:get/get.dart';
import 'package:tecno_blog/controller/article_single_page_controller.dart';
import 'package:tecno_blog/controller/home_controller.dart';
import 'package:tecno_blog/controller/list_article_controller.dart';
import 'package:tecno_blog/controller/register_controller.dart';
import 'package:tecno_blog/controller/small_controllers/bookmarked_controller.dart';
import 'package:tecno_blog/controller/small_controllers/page_handler_controller.dart';


class ArticleSingleBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => ArticleSinglePageController());
    Get.lazyPut(() => BookmarkedController());
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