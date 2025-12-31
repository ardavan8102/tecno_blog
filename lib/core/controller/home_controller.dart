import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/core/models/article_model.dart';
import 'package:tecno_blog/core/models/podcast_model.dart';
import 'package:tecno_blog/core/models/poster_model.dart';
import 'package:tecno_blog/core/models/tags_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class HomeController extends GetxController {

  late Rx<PosterModel> poster = PosterModel().obs;

  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();

  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  dynamic getHomeItems() async {

    loading.value = true;

    var response = await DioService().getMethod(ApiUrl.getHomeItems);

    if (response.statusCode == 200) {
      var posterData = response.data['poster'];
      var topVisiteds = response.data['top_visited'];
      var topPodcasts = response.data['top_podcasts'];
      var tagsData = response.data['tags'];

      topVisiteds.forEach((element){
        topVisitedList.add(
          ArticleModel.fromJson(element)
        );
      });

      topPodcasts.forEach((element){
        topPodcastsList.add(
          PodcastModel.fromJson(element)
        );
      });

      poster.value = PosterModel.fromJson(posterData);

      tagsData.forEach((element){
        tagsList.add(
          TagsModel.fromJson(element)
        );
      });

      loading.value = false;

    }

  }

}