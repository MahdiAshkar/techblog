import 'package:flutter/material.dart';

import '../my_colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.3,
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}
