import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tecblog/components/my_colors.dart';
import 'package:tecblog/components/my_component.dart';
import 'package:tecblog/components/my_string.dart';
import 'package:tecblog/controller/list_article_controller.dart';
import 'package:tecblog/gen/assets.gen.dart';
import 'package:tecblog/model/fake_data.dart';

class SingleScreen extends StatelessWidget {
  SingleScreen({Key? key}) : super(key: key);
  ListArticleController articleController = Get.put(ListArticleController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 3,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: articleController.articleList[3].image!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => loading(),
                      errorWidget: (context, url, error) =>
                          Image.asset(Assets.images.singlePlaceHolder.path),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        height: 64.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: GradiantColors.appBarSingleScreen,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              Spacer(),
                              Icon(
                                Icons.bookmark_border_rounded,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Icon(
                                Icons.share_rounded,
                                color: Colors.white,
                                size: 32.0,
                              ),
                              SizedBox(
                                width: 16,
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 12.0, bottom: 8.0),
                child: Text(
                  articleController.articleList[6].title!,
                  style: textTheme.headlineLarge,
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      Assets.images.profileAvatar.path,
                      height: 50.0,
                      width: 50.0,
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      articleController.articleList[3].author!,
                      style: textTheme.headline4,
                    ),
                    const SizedBox(width: 16.0),
                    Text(
                      '2 روز پیش ',
                      style: textTheme.caption,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '''چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.
        
        سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
                ''',
                  style: textTheme.headline4,
                ),
              ),
              tags(textTheme),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: EdgeInsets.only(right: Get.width / 10),
                child: Text(
                  MyStrings.relatedArticles,
                  style: textTheme.headline3,
                ),
              ),
              relatedArticleList(
                textTheme,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget tags(TextTheme textTheme) {
    double bodyMargin = Get.width / 10;
    return SizedBox(
      height: Get.height / 20.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 0, index == 0 ? bodyMargin : 8, 0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: SolidColors.tagSelected,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('بازی کامپیوتری'),
                  ),
                ));
          }),
    );
  }

  Widget relatedArticleList(TextTheme textTheme) {
    double bodyMargin = Get.width / 10;
    return SizedBox(
      height: Get.height / 3.5,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: articleController.articleList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodyMargin : 8, 0),
                child: Column(
                  children: [
                    //Stack Poster Blog
                    Stack(
                      children: [
                        // cached Network image
                        SizedBox(
                          width: Get.width / 2.4,
                          height: Get.height / 5.3,
                          child: CachedNetworkImage(
                            imageUrl:
                                articleController.articleList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                              foregroundDecoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  gradient: LinearGradient(
                                      colors: GradiantColors.blogPoster,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              color: Colors.grey,
                              size: 50.0,
                            ),
                            placeholder: (context, url) => loading(),
                          ),
                        ),
                        // bottom Text Blog poster
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                articleController.articleList[index].author!,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    articleController.articleList[index].view!,
                                    style: textTheme.subtitle1,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //title Post Blog
                    SizedBox(
                      width: Get.width / 2.4,
                      child: Text(
                        articleController.articleList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: textTheme.headline4,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
