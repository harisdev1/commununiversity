import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(context: context, title: 'Change Password'),
          Expanded(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //  key: controller.loginFormKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),
                    CustomTextfield(
                      prefixIconName: AssetPath.password,
                      label: 'Current Password',
                      isSuffixIcon: true,
                      isPasswordField: true,
                    ),
                    SizedBox(height: 15.h),
                    CustomTextfield(
                      prefixIconName: AssetPath.password,
                      isSuffixIcon: true,
                      isPasswordField: true,
                      label: 'New Password',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextfield(
                      prefixIconName: AssetPath.password,
                      isSuffixIcon: true,
                      isPasswordField: true,
                      label: 'New Password',
                    ),
                    const Spacer(flex: 5),
                    SimpleButton(
                      button_color: AppColors.cyan,
                      button_label: 'Save Changes',
                      onButtonPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
