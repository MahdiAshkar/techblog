import 'package:flutter/material.dart';

import '../my_colors.dart';

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
