import 'package:communiversity/core/my_coins/widgets/tar_heel_listtile.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoinsPage extends StatelessWidget {
  const MyCoinsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(
            context: context,
            title: 'My Tar Heel Tracks',
            height: 182.h,
            subWidget: Padding(
              padding: EdgeInsets.only(top: 60.h, bottom: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    fontSize: 24,
                    text: '38,707',
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    fontSize: 20,
                    text: 'Total Tar Heels',
                    color: AppColors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  CustomText(fontSize: 20.sp, text: 'Redeemed Tar Heels'),
                  SizedBox(height: 20.h),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(0.0),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: ((context, index) => TarHeelListTile()),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 15.h),
                    ),
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
