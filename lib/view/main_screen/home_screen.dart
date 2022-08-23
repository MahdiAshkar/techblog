import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/controller/home_screen_controller.dart';
import 'package:tecblog/model/fake_data.dart';
import '../../components/my_colors.dart';
import '../../components/my_string.dart';
import '../../components/my_component.dart';
import '../../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.isLoading.value
              ? Padding(
                  padding: EdgeInsets.only(top: size.height / 3),
                  child: loading(),
                )
              : Column(
                  children: [
                    poster(),
                    // size height 24
                    const SizedBox(
                      height: 24,
                    ),
                    tags(),
                    // Text SeeMore
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, top: 32),
                      child: MyTitleIconRow(
                          bodyMargin: bodyMargin,
                          textTheme: textTheme,
                          assetNameIcon: Assets.icons.penIcon.path,
                          title: MyStrings.viewHotestArticles),
                    ),

                    topVisited(),

                    // Text SeeMore
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, top: 32),
                      child: MyTitleIconRow(
                          bodyMargin: bodyMargin,
                          textTheme: textTheme,
                          assetNameIcon: Assets.icons.podcastIcon.path,
                          title: MyStrings.viewHotestPodcasts),
                    ),
                    topPodcasts(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        // Image Poster
        SizedBox(
          width: size.width / 1.19,
          height: size.height / 4.20,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              foregroundDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  gradient: LinearGradient(
                      colors: GradiantColors.homePoster,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
            placeholder: (context, url) => loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
              size: 50.0,
            ),
          ),
        ),
        //Text bottom Poster
        Positioned(
          left: 0,
          bottom: 8,
          right: 15,
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Text(
              //       homepagePosterMap['writer'] +
              //           ' - ' +
              //           homepagePosterMap['date'],
              //       style: textTheme.subtitle1,
              //     ),
              //     Row(
              //       children: [
              //         Text(
              //           homepagePosterMap['view'],
              //           style: textTheme.subtitle1,
              //         ),
              //         const SizedBox(width: 8),
              //         const Icon(
              //           Icons.remove_red_eye_sharp,
              //           color: Colors.white,
              //           size: 18,
              //         )
              //       ],
              //     )
              //   ],
              // ),

              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headline1,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 16, index == 0 ? bodyMargin : 8, 0),
                child: Column(
                  children: [
                    //Stack Poster Blog
                    Stack(
                      children: [
                        // cached Network image
                        SizedBox(
                          width: size.width / 2.4,
                          height: size.height / 5.3,
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
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
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homeScreenController
                                        .topVisitedList[index].view!,
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
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
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

  Widget topPodcasts() {
    return SizedBox(
      height: size.height / 2.5,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 16, index == 0 ? bodyMargin : 8, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.8,
                    width: size.width / 3.1,
                    child: CachedNetworkImage(
                      imageUrl:
                          homeScreenController.topPodcastList[index].image!,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: imageProvider)),
                      ),
                      placeholder: (context, url) => loading(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 50.0,
                      ),
                    ),
                  ),
                  //
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width / 3.1,
                    child: Text(
                      homeScreenController.topPodcastList[index].title!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.headline4,
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget tags() {
    return SizedBox(
      height: size.height / 21.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 0, index == 0 ? bodyMargin : 8, 0),
              child: TagContainer(
                textTheme: textTheme,
                index: index,
              ),
            );
          }),
    );
  }
}
