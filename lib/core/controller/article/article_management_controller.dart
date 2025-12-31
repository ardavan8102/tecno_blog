import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/consts/storage.dart';
import 'package:tecno_blog/core/models/article_info.dart';
import 'package:tecno_blog/core/models/article_model.dart';
import 'package:tecno_blog/core/models/tags_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class ArticleManagementController extends GetxController {

  RxList<ArticleModel> articleList = RxList.empty();
  
  RxBool isLoading = false.obs;

  TextEditingController titleTextEditingController = TextEditingController();

  Rx<ArticleInfo> articleInfoModel = ArticleInfo(
    title: 'مثلا بنویس -> یه مقاله باحال :)',
    content: 'این قسمت میتونید یک مقاله جدید بنویسید',
    image: '',
  ).obs;
  
  RxList<TagsModel> tagList = RxList.empty();

  @override
  void onInit(){
    super.onInit();
    getArticleList();
  }

  dynamic getArticleList() async {

    isLoading.value = true;

    String id = GetStorage().read(AppStorage.userId).toString();

    //var response = await DioService().getMethod(ApiUrl.getArticleListPublishedByMe + id);
    var response = await DioService().getMethod('${ApiUrl.getArticleListPublishedByMe}1'); // Test

    if (response.statusCode == 200) {
      
      response.data.forEach((element){
        articleList.add(
          ArticleModel.fromJson(element)
        );
      });

      isLoading.value = false;

    }
  }


  void updateTitle() {

    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });

  }



}