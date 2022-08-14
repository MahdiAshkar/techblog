import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tecblog/model/fake_data.dart';
import '../my_colors.dart';

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
