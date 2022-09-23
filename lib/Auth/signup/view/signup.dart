// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_drop_down.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/link_widget.dart';
import 'package:communiversity/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _signUpForm() => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          //  key: controller.loginFormKey,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              ProfileAvatar(73.w, 68.w, AssetPath.userProfile),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.user,
                label: AppStrings.userName,
              ),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.email,
                label: AppStrings.email,
              ),
              SizedBox(height: 10.h),
              CustomDropdownField(
                Items: AppStrings.programOptionsList,
                onchange: (value) {},
              ),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.location,
                label: AppStrings.address,
              ),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.password,
                isSuffixIcon: true,
                isPasswordField: true,
                label: AppStrings.password,
              ),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.password,
                isSuffixIcon: true,
                isPasswordField: true,
                label: AppStrings.confirmNewPassword,
              ),
              SizedBox(height: 7.h),
              CustomTextfield(
                prefixIconName: AssetPath.user,
                label: AppStrings.bio,
              ),
              SizedBox(height: 7.h),
              SimpleButton(
                button_color: AppColors.cyan,
                button_label: AppStrings.signup.toUpperCase(),
                onButtonPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              SizedBox(height: 18.h),
              LinkWidget(
                preText: AppStrings.alreadyHaveAnAccount,
                linkText: AppStrings.login,
                onTap: () {
                  Get.to(LoginPage());
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
    return Scaffold(
      body: CustomNestedScrollView(
        child: _signUpForm(),
        horizontalPadding: 30.w,
        title: 'Sign Up',
        background: Image.asset(
          AssetPath.signup,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
