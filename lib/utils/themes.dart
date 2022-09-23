import 'package:communiversity/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Themes {
  static PinTheme pinCodeFieldTheme = PinTheme(
    inactiveFillColor: AppColors.cream,
    selectedFillColor: AppColors.cream,
    selectedColor: Colors.white,
    inactiveColor: AppColors.cream,
    shape: PinCodeFieldShape.circle,
    borderRadius: BorderRadius.circular(28),
    fieldHeight: 50.h,
    fieldWidth: 49.w,
    activeFillColor: Colors.white,
  );
}
