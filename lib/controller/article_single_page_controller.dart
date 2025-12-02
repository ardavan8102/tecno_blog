import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/models/article_info.dart';
import 'package:tecno_blog/services/dio_service.dart';

class ArticleSinglePageController extends GetxController {

  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  Rx<ArticleInfo> articleInfoModel = ArticleInfo().obs;

  @override
  onInit(){
    super.onInit();
  }

  dynamic getArticleInformation() async {
    loading.value = true;

    var userId = ''; // TODO : User id is hardcode
    var response = await DioService().getMethod('${ApiUrl.baseURL}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      
      articleInfoModel.value = ArticleInfo.fromJson(response.data);

      loading.value = false;

    }


  }

}