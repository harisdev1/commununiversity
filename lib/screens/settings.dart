import 'package:communiversity/Auth/change_password/view/change_password.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:communiversity/widgets/simple_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(context: context, title: 'Settings'),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  fontSize: 20.sp,
                  text: 'Recieve Notifications',
                  fontWeight: FontWeight.w200,
                ),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: state,
                    onChanged: (value) {
                      state = value;
                      setState(
                        () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SimpleButton(
              button_label: 'Change password',
              onButtonPressed: () {
                Get.to(ChangePasswordPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
