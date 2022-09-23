import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ProfileAvatar(double upperRadius, double lowerRadius, String assetName) =>
    CircleAvatar(
      radius: upperRadius,
      backgroundColor: AppColors.cyan,
      child: CircleAvatar(
        radius: lowerRadius,
        backgroundImage: AssetImage(assetName),
        backgroundColor: Colors.white,
      ),
    );
