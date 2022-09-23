import 'package:communiversity/utils/app_colors.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpleButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
  String button_label;
  Color? button_color;
  Color? label_color;
  Function()? onButtonPressed;
  // ignore: use_key_in_widget_constructors, non_constant_identifier_names
  SimpleButton(
      {this.label_color = Colors.white,
      this.button_color = AppColors.cyan,
      required this.button_label,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onButtonPressed,
      child: Entry.all(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.h),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            width: deviceWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.w),
              color: button_color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  button_label,
                  style: TextStyle(
                    color: label_color,
                    // fontFamily: 'MyLove',
                    fontSize: 17.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
