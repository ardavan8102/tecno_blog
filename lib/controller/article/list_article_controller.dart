import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/models/article_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class ListArticleController extends GetxController {

  RxList<ArticleModel> articlesList = RxList();

  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getNewArticlesList();
  }

  dynamic getNewArticlesList() async {

    loading.value = true;

    var response = await DioService().getMethod(ApiUrl.getNewArticles);

    if (response.statusCode == 200) {
      
      response.data.forEach((element){
        articlesList.add(
          ArticleModel.fromJson(element)
        );
      });

      loading.value = false;

    }
  }

  dynamic getArticleListByTagId(String id) async {

    articlesList.clear();

    loading.value = true;

    var userId = '';

    var response = await DioService().getMethod('${ApiUrl.baseURL}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      
      response.data.forEach((element){
        articlesList.add(
          ArticleModel.fromJson(element)
        );
      });

      loading.value = false;

    }
  }

}