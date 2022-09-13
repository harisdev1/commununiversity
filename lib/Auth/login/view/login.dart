// ignore_for_file: prefer_const_constructors

import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: CustomText(
              color: AppColors.black,
              fontSize: 15.sp,
              text: AppStrings.login,
            ),
            centerTitle: true,
            floating: false,
            pinned: false,
            snap: false,
            expandedHeight: 200.h,
            flexibleSpace: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    AssetPath.login,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  //  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 120.h),
                      SizedBox(height: 30.h),
                      CustomTextfield(
                        prefixIcon: Icons.email,
                        label: AppStrings.email,
                        //   onSaved: (value) {
                        //   return controller.email = value!;
                        //  },
                        //  fieldValidator: (value) {
                        //     return FieldValidator.validateEmail(value!);
                        //   },
                      ),
                      SizedBox(height: 10.h),
                      CustomTextfield(
                        prefixIcon: Icons.lock,
                        isSuffixIcon: true,
                        isPasswordField: true,
                        label: AppStrings.password,
                        // onSaved: (value) {
                        //   controller.password = value!;
                        // },
                        // fieldValidator: (value) {
                        //   return FieldValidator.validatePassword(value!);
                        // },
                      ),
                      SizedBox(height: 7.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LinkWidget(
                            text: AppStrings.forgotPassword,
                            onButtonPressed: () {
                              //    Get.to(ForgotPassword());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 7.h),
                      SimpleButton(
                        button_color: AppColors.cyan,
                        button_label: AppStrings.login.toUpperCase(),
                        onButtonPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          //  controller.checkLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
