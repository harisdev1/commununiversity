import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_listtile.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:communiversity/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                fontSize: 25.sp,
                text: 'Hi Joe Brewer 👋 ',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20.h),
              CustomText(
                fontSize: 17.sp,
                text: 'Current Event',
                fontWeight: FontWeight.w900,
              ),
              SizedBox(height: 20.h),
              const CustomListTile(),
              SizedBox(height: 20.h),
              CustomText(
                fontSize: 17.sp,
                text: 'Upcoming Events',
                fontWeight: FontWeight.w900,
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 135.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      width: 200.w,
                      child: const CustomListTile(issubHeading: false),
                    );
                  },
                  //   separatorBuilder: (BuildContext context, int index) =>
                  //       SizedBox(
                  //     width: 9.w,
                  //   ),
                ),
              ),
              SizedBox(height: 10.h),
              const CustomListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
