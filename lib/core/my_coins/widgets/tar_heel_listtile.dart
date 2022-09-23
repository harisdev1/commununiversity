import 'package:communiversity/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TarHeelListTile extends StatelessWidget {
  const TarHeelListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 22.h,
          bottom: 21.h,
          left: 10.w,
          right: 10.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('13th June,2022'),
            Icon(Icons.ac_unit),
            Text('274'),
            Text('Coffee Shop', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
