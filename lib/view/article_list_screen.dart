import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/components/my_colors.dart';
import 'package:tecblog/components/my_component.dart';
import 'package:tecblog/controller/list_article_controller.dart';
import 'package:tecblog/controller/single_article_controller.dart';
import 'package:tecblog/view/single_screen.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  ListArticleController listArticleController =
      Get.put(ListArticleController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      appBar: appBar('مقالات جدید', textTheme),
      body: SizedBox(
        child: Obx(
          () => ListView.builder(
            itemCount: listArticleController.articleList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  singleArticleController.id.value =
                      int.parse(listArticleController.articleList[index].id!);
                  Get.to(
                    SingleScreen(),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: Get.height / 6,
                        width: Get.width / 3,
                        child: CachedNetworkImage(
                          imageUrl:
                              listArticleController.articleList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                            );
                          },
                          placeholder: (context, url) => loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50.0,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: Get.width / 1.8,
                              child: Text(
                                listArticleController.articleList[index].title!,
                                style: textTheme.headline4,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                listArticleController
                                    .articleList[index].author!,
                                style: textTheme.caption,
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Text(
                                '${listArticleController.articleList[index].view!} بازدید  ',
                                style: textTheme.caption,
                              ),
                            ],
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   width: 16.0,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
