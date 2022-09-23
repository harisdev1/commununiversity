import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(
            title: 'Edit Profile',
            context: context,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          radius: 73.w,
                          backgroundColor: AppColors.cyan,
                          child: CircleAvatar(
                            radius: 68.w,
                            backgroundImage: const AssetImage(AssetPath.login),
                            backgroundColor: Colors.red,
                          ),
                        ),
                        Positioned(
                          right: -3.w,
                          bottom: -7.h,
                          child: CircleAvatar(
                            radius: 30.w,
                            backgroundColor: AppColors.cyan,
                            child: CircleAvatar(
                              radius: 28.w,
                              backgroundColor: Colors.yellow,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    CustomTextfield(
                      label: 'UserName',
                      prefixIconName: AssetPath.user,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextfield(
                      label: 'Email',
                      prefixIconName: AssetPath.email,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextfield(
                      label: 'Choose Program',
                      prefixIconName: AssetPath.email,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextfield(
                      label: 'Address',
                      prefixIconName: AssetPath.location,
                    ),
                    SizedBox(height: 5.h),
                    CustomTextfield(
                      label: 'Bio',
                      prefixIconName: AssetPath.email,
                    ),
                    SizedBox(height: 5.h),
                    SimpleButton(
                        button_label: 'Update', onButtonPressed: () {}),
                    SizedBox(height: 20.h),
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
