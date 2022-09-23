import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_listtile.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GamesPage extends StatefulWidget {
  GamesPage({Key? key}) : super(key: key);
  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customAppBar(
          context: context,
          title: 'Games',
          leadingIconPath: AssetPath.drawer,
          isActions: true,
          subWidget: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 30.w, right: 30.w),
            child: CustomText(
              fontSize: 15.sp,
              text: 'AR camera with coins on the track',
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 90.h, left: 30.w, right: 30.w),
        //   child: CustomTextfield(
        //     hintText: 'Search',
        //     isPrefixIcon: false,
        //   ),
        // ),
        Expanded(
          child: Image.network(
            'https://i.pcmag.com/imagery/articles/01IB0rgNa4lGMBlmLyi0VP6-6..v1611346416.png',
            fit: BoxFit.fill,
          ),
          //     SingleChildScrollView(
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Image.network(
          //             'https://i.pcmag.com/imagery/articles/01IB0rgNa4lGMBlmLyi0VP6-6..v1611346416.png',
          //           ),
          //         ],
          //       ),
          //     ),
        ),
      ],
    );
  }
}
