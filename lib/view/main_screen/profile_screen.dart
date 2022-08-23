import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../../components/my_string.dart';
import '../../components/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
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
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(Assets.images.profileAvatar.path),
                height: 100,
              ),
              const SizedBox(
                height: 12,
              ),
              MyTitleIconRow(
                  mainAxisAlignment: MainAxisAlignment.center,
                  bodyMargin: bodyMargin,
                  textTheme: textTheme,
                  assetNameIcon: Assets.icons.penIcon.path,
                  title: MyStrings.editPictureProfile),
              const SizedBox(
                height: 60,
              ),
              Text(
                'فاطمه امیری',
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'fatemeamiri@gmail.com',
                style: textTheme.headline4,
              ),
              const SizedBox(
                height: 40,
              ),
              TechDivider(size: size),
              MyInkWell(
                textTheme: textTheme,
                text: MyStrings.myFavoriteArticle,
                onTap: () {},
              ),
              TechDivider(size: size),
              MyInkWell(
                textTheme: textTheme,
                text: MyStrings.myFavoritePodcast,
                onTap: () {},
              ),
              TechDivider(size: size),
              MyInkWell(
                textTheme: textTheme,
                text: MyStrings.logOutAccount,
                onTap: () {},
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ));
  }
}
