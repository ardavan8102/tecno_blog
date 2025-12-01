import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/models/article_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class ArticleController extends GetxController {

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

}