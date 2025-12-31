import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/core/models/article_info.dart';
import 'package:tecno_blog/core/models/article_model.dart';
import 'package:tecno_blog/core/models/tags_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class ArticleSinglePageController extends GetxController {

  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  Rx<ArticleInfo> articleInfoModel = ArticleInfo().obs;

  RxList<ArticleModel> relatedArticlesList = RxList();

  RxList<TagsModel> articleTagsList = RxList();


  dynamic getArticleInformation() async {

    articleInfoModel = ArticleInfo().obs;

    loading.value = true;

    var userId = ''; // TODO : User id is hardcode
    var response = await DioService().getMethod('${ApiUrl.baseURL}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      
      articleInfoModel.value = ArticleInfo.fromJson(response.data);

      response.data['related'].forEach((element){
        relatedArticlesList.add(
          ArticleModel.fromJson(element)
        );
      });

      response.data['tags'].forEach((element){
        articleTagsList.add(
          TagsModel.fromJson(element)
        );
      });

      loading.value = false;

    }


  }

}