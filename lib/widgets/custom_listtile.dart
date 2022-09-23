import 'package:communiversity/screens/event_details.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final bool issubHeading;
  const CustomListTile({super.key, this.issubHeading = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(EventDetailsPage()),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.dimWhite,
          borderRadius: BorderRadius.circular(11),
          boxShadow: const [
            BoxShadow(
              color: AppColors.lightGrey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AssetPath.home1,
            ),
            CustomText(fontSize: 15.sp, text: 'Lorem Ipsum Event 03'),
            Visibility(
              visible: issubHeading,
              child: Row(
                children: [
                  CustomText(
                    fontSize: 15.sp,
                    text: 'Central Auditorium',
                  ),
                  CustomText(
                    fontSize: 15.sp,
                    text: '13:30 PM',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
