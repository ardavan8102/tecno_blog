import 'dart:developer';

import 'package:get/get.dart';
import 'package:tecno_blog/consts/api_url.dart';
import 'package:tecno_blog/models/home_page_models/article_model.dart';
import 'package:tecno_blog/models/home_page_models/podcast_model.dart';
import 'package:tecno_blog/models/home_page_models/poster_model.dart';
import 'package:tecno_blog/models/home_page_models/tags_model.dart';
import 'package:tecno_blog/services/dio_service.dart';

class HomeController extends GetxController {

  late Rx<PosterModel> poster;

  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastsList = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  dynamic getHomeItems() async {

    var response = await DioService().getMethod(ApiUrl.getHomeItems);

    if (response.statusCode == 200) {
      //var poster = response.data['poster'];
      var topVisiteds = response.data['top_visited'];
      var topPodcasts = response.data['top_podcasts'];
      //var tags = response.data['tags'];

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
    } else {
      log('Status Code ${response.statuseCode} for Home Items');
    }

  }

}