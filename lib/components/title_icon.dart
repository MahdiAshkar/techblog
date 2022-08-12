import 'package:flutter/material.dart';
import '../my_colors.dart';

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
