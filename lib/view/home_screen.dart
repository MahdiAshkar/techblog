import 'package:flutter/material.dart';
import 'package:tecblog/components/title_icon.dart';
import 'package:tecblog/model/fake_data.dart';
import '../components/my_tag.dart';
import '../gen/assets.gen.dart';
import '../my_colors.dart';
import '../my_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            PosterTopPage(size: size, textTheme: textTheme),
            // size 24
            const SizedBox(
              height: 24,
            ),

            TagList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),

            // Text SeeMore
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, top: 32),
              child: MyTitleIconRow(
                  bodyMargin: bodyMargin,
                  textTheme: textTheme,
                  assetNameIcon: Assets.icons.penIcon.path,
                  title: MyStrings.viewHotestArticles),
            ),

            BlogList(size: size, bodyMargin: bodyMargin, textTheme: textTheme),

            // Text SeeMore
            Padding(
              padding: EdgeInsets.only(right: bodyMargin, top: 32),
              child: MyTitleIconRow(
                  bodyMargin: bodyMargin,
                  textTheme: textTheme,
                  assetNameIcon: Assets.icons.podcastIcon.path,
                  title: MyStrings.viewHotestPodcasts),
            ),
            PodcastList(
                size: size, bodyMargin: bodyMargin, textTheme: textTheme),
            //size MediaQuery=> height /8
            SizedBox(
              height: size.height / 8,
            ),
          ],
        ),
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  const BlogList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: blogList.getRange(0, 5).length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 16, index == 0 ? bodyMargin : 8, 0),
              child: Column(
                children: [
                  //Stack Poster Blog
                  SizedBox(
                    width: size.width / 2.4,
                    height: size.height / 5.3,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: NetworkImage(blogList[index].imageUrl),
                                  fit: BoxFit.cover)),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.blogPoster,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
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
                                blogList[index].writer,
                                style: textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    blogList[index].views,
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //title Post Blog
                  SizedBox(
                    width: size.width / 2.4,
                    child: Text(
                      blogList[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: textTheme.headline4,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class PodcastList extends StatelessWidget {
  const PodcastList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 4.0,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: podcastList.getRange(0, 5).length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(8, 16, index == 0 ? bodyMargin : 8, 0),
            child: Column(
              children: [
                Container(
                  height: size.height / 5.8,
                  width: size.width / 3.1,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(podcastList[index].imageUrl))),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  podcastList[index].title,
                  style: textTheme.headline4,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 21.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
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

class PosterTopPage extends StatelessWidget {
  const PosterTopPage({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image Poster
        Container(
          width: size.width / 1.19,
          height: size.height / 4.20,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(homepagePosterMap['imageAsset']),
                  fit: BoxFit.cover)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradiantColors.homePoster,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        //Text bottom Poster
        Positioned(
          left: 0,
          bottom: 8,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homepagePosterMap['writer'] +
                        ' - ' +
                        homepagePosterMap['date'],
                    style: textTheme.subtitle1,
                  ),
                  Row(
                    children: [
                      Text(
                        homepagePosterMap['view'],
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
              Text(
                'دوازده قدم برنامه نویسی یک دوره ی...',
                style: textTheme.headline1,
              )
            ],
          ),
        ),
      ],
    );
  }
}
