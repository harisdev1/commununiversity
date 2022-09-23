import 'package:communiversity/screens/edit_profile.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(
          title: 'Profile',
          context: context,
          leadingIconPath: AssetPath.drawer,
          isActions: true,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  CircleAvatar(
                    radius: 73.w,
                    backgroundColor: AppColors.cyan,
                    child: CircleAvatar(
                      radius: 68.w,
                      backgroundImage: const AssetImage(AssetPath.login),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  customTile(title: 'Name ', subtitle: 'Joe Drawer'),
                  customTile(title: 'Email ', subtitle: 'Joe_brewer@gmail.com'),
                  customTile(
                      title: 'Program Enrolled',
                      subtitle: 'Aerospace Technologies'),
                  customTile(
                      title: 'Address', subtitle: '1234 lorem dmmy Address'),
                  customTile(title: 'Bio', subtitle: 'Lorem aksmaksmaks'),
                  SizedBox(height: 10.h),
                  SimpleButton(
                    button_label: 'Edit Profile ',
                    onButtonPressed: () {
                      Get.to(EditProfilePage());
                    },
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

customTile(
    {required String title,
    required String subtitle,
    bool? isThreeLines = false}) {
  return ListTile(
    visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
    title: Text(title),
    subtitle: Padding(
      padding: EdgeInsets.only(top: 5.w),
      child: Text(subtitle),
    ),
  );
}
