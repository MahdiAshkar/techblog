import 'dart:isolate';

import 'package:get/get.dart';
import 'package:tecblog/model/article_model.dart';

import '../components/api_constatnt.dart';
import '../services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getArticle();
  }

  getArticle() async {
    isLoading.value = true;
    //TODO get userid implement
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }

      isLoading.value = false;
    }
  }
}
