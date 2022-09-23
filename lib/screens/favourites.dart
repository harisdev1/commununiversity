import 'package:communiversity/core/my_coins/widgets/tar_heel_listtile.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_listtile.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dimWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(context: context, title: 'Favourites'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 27.h),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: ((context, index) => CustomListTile()),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(height: 15.h),
            ),
          ),
        ],
      ),
    );
  }
}
