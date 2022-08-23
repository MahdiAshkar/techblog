import 'dart:developer';
import 'package:get/get.dart';
import 'package:tecblog/components/api_constatnt.dart';
import 'package:tecblog/model/article_model.dart';
import 'package:tecblog/model/podcast_model.dart';
import 'package:tecblog/model/poster_model.dart';
import 'package:tecblog/model/tag_model.dart';
import 'package:tecblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagModel> tagsList = RxList<TagModel>();
  RxList<ArticleModel> topVisitedList = RxList<ArticleModel>();
  RxList<PodcastModel> topPodcastList = RxList<PodcastModel>();
  RxBool isLoading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    isLoading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);
    if (response.statusCode == 200) {
      for (var element in response.data['top_visited']) {
        topVisitedList.add(ArticleModel.fromJson(element));
      }
      for (var element in response.data['top_podcasts']) {
        topPodcastList.add(PodcastModel.fromJson(element));
      }
      for (var element in response.data['tags']) {
        tagsList.add(TagModel.fromJson(element));
      }
      poster.value = PosterModel.fromJson(response.data['poster']);
      isLoading.value = false;
    }
  }
}
