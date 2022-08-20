import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/fake_data.dart';
import 'my_colors.dart';

class MyInkWell extends StatelessWidget {
  const MyInkWell({
    Key? key,
    required this.textTheme,
    required this.text,
    required this.onTap,
    this.heightButton = 45,
  }) : super(key: key);

  final TextTheme textTheme;
  final String text;
  final double heightButton;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: SolidColors.primaryColor,
      onTap: onTap,
      child: SizedBox(
        height: heightButton,
        child: Center(
          child: Text(
            text,
            style: textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
    this.padding = true,
  }) : super(key: key);

  final Size size;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.3,
      color: SolidColors.divider,
      indent: padding ? size.width / 6 : null,
      endIndent: padding ? size.width / 6 : null,
    );
  }
}

class TagContainer extends StatelessWidget {
  const TagContainer({
    Key? key,
    required this.textTheme,
    required this.index,
    this.tagSelected = false,
    this.onTap,
  }) : super(key: key);

  final TextTheme textTheme;
  final int index;
  final bool tagSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height / 22.83,
      decoration: BoxDecoration(
          gradient: tagSelected
              ? null
              : const LinearGradient(
                  colors: GradiantColors.tags,
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft),
          color: tagSelected ? SolidColors.tagSelected : null,
          borderRadius: const BorderRadius.all(Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          mainAxisAlignment: tagSelected
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: tagSelected
              ? [
                  Text(
                    selectedTag.elementAt(index),
                    style: textTheme.headline4,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: const Icon(CupertinoIcons.delete,
                        size: 20, color: Colors.grey),
                  ),
                ]
              : [
                  const Icon(Icons.tag_sharp, size: 16, color: Colors.white),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    tagList[index].title,
                    style: textTheme.headline2,
                  ),
                ],
        ),
      ),
    );
  }
}

class MyTitleIconRow extends StatelessWidget {
  const MyTitleIconRow({
    Key? key,
    required this.bodyMargin,
    required this.textTheme,
    required this.assetNameIcon,
    required this.title,
    this.colorIcon = SolidColors.seeMore,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final double bodyMargin;
  final TextTheme textTheme;
  final String assetNameIcon;
  final String title;
  final Color colorIcon;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ImageIcon(
          AssetImage(assetNameIcon),
          color: colorIcon,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: textTheme.headline3,
        )
      ],
    );
  }
}
