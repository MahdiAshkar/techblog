import 'package:flutter/material.dart';

import '../my_colors.dart';

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
