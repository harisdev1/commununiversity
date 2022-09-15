import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomAppBar(
                    appbarContext: context,
                    title: 'Profile',
                    leadingIcon: Icons.menu,
                  ),
                  SizedBox(height: 40.h),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 73.w,
                        backgroundColor: AppColors.cyan,
                        child: CircleAvatar(
                          radius: 68.w,
                          // backgroundImage:
                          //     NetworkImage('https://via.placeholder.com/150'),
                          backgroundColor: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
