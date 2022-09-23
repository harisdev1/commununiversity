// ignore_for_file: prefer_const_constructors

import 'package:communiversity/Auth/verify_otp/view/verify_otp.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';
      
class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _forgetPasswordForm() => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //  key: controller.loginFormKey,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              CustomTextfield(
                prefixIconName: AssetPath.email,
                label: AppStrings.email,
              ),
              SizedBox(height: 7.h),
              SimpleButton(
                button_color: AppColors.cyan,
                button_label: AppStrings.sendCode.toUpperCase(),
                onButtonPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Get.to(VerifyOtpPage());
                },
              ),
            ],
          ),
        );
    return Scaffold(
      body: CustomNestedScrollView(
        horizontalPadding: 30.w,
        title: 'Forgot Password',
        background: Image.asset(
          AssetPath.forgotPassword,
          fit: BoxFit.cover,
        ),
        child: _forgetPasswordForm(),
      ),
    );
  }
}
