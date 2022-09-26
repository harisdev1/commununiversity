// ignore_for_file: prefer_const_constructors

import 'package:communiversity/Auth/reset_password/controller/reset_password_controller.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _resetpasswordForm() {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: ResetPasswordController.i.resetPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            CustomTextfield(
              prefixIconName: AssetPath.password,
              isSuffixIcon: true,
              isPasswordField: true,
              label: AppStrings.newPassword,
            ),
            SizedBox(height: 10.h),
            CustomTextfield(
              prefixIconName: AssetPath.password,
              isSuffixIcon: true,
              isPasswordField: true,
              label: AppStrings.confirmNewPassword,
            ),
            SizedBox(height: 98.h),
            SimpleButton(
              button_color: AppColors.cyan,
              button_label: AppStrings.changePassword.toUpperCase(),
              onButtonPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                ResetPasswordController.i.checkResetPassword();
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: CustomNestedScrollView(
        horizontalPadding: 30.w,
        title: 'Reset Password',
        background: Image.asset(
          AssetPath.resetPassword,
          fit: BoxFit.cover,
        ),
        child: _resetpasswordForm(),
      ),
    );
  }
}
