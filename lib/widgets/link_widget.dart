// ignore_for_file: must_be_immutable

import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LinkWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String linkText;
  bool isUnderLine;
  final String? preText;
  double? fontSize;
  Color? color;
  LinkWidget(
      {Key? key,
      this.color,
      this.preText,
      this.fontSize,
      this.isUnderLine = false,
      required this.linkText,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(fontSize: 15.sp, text: preText ?? ""),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkText,
            style: TextStyle(
              color: color ?? Colors.black,
              fontSize: fontSize ?? 15.sp,
              decoration:
                  isUnderLine ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
