import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        children: [
          customAppBar(context: context, title: AppStrings.privacyPolicy),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: const Text(AppStrings.lorem),
            ),
          ),
        ],
      ),
    );
  }
}
