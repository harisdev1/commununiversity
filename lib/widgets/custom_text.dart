import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomText extends StatelessWidget {
  final double fontSize;
  final String text;
  final Color? color;
  final String? fontFamily;
  final bool? isUnderline;
  final FontWeight? fontWeight;
  CustomText({
    super.key,
    required this.fontSize,
    required this.text,
    this.color,
    this.fontFamily,
    this.isUnderline = false,
    this.fontWeight,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.black,
        // fontFamily: fontFamily ?? 'MyLove',
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: (isUnderline == true)
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );
  }
}
