import 'package:get/get.dart';
import 'package:tecblog/model/article_model.dart';
import '../components/api_constatnt.dart';
import '../services/dio_service.dart';

class SingleArticleController extends GetxController {
  RxInt id = RxInt(0);
  @override
  void onInit() {
    super.onInit();
  }

  getArticleInfo() async {
    var response = await DioService().getMethod(ApiConstant.getArticleList);
    if (response.statusCode == 200) {
      for (var element in response.data) {
        // articleList.add(ArticleModel.fromJson(element));
      }
    }
  }
}
