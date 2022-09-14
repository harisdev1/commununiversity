import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

CustomAppBar(BuildContext context) => SizedBox(
      //  preferredSize: Size(1.sw,0.13.sh),
      width: 1.sw,
      height: 0.13.sh,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          SizedBox(
            child: AppBar(
              centerTitle: true,
              backgroundColor: AppColors.cyan,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) => GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.menu),
                  ),
                  onTap: () {
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
              ),
              primary: false,
              title: const Text('Home'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.notifications,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Positioned(
            top: 0.10.sh,
            left: 20.w,
            right: 20.w,
            child: CustomTextfield(
              hintText: AppStrings.search,
            ),
          ),
        ],
      ),
    );



// // ignore_for_file: must_be_immutable
// import 'dart:ui';


// import 'package:communiversity/utils/asset_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final List<Widget>? trailing;
//   const CustomAppBar({required this.title, this.trailing});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: Builder(
//         builder: (BuildContext context) => GestureDetector(
//           child: const Padding(
//             padding: EdgeInsets.all(6.0),
//             child: Image(
//               image: AssetImage(AssetPath.back),
//             ),
//           ),
//           onTap: () => Get.back(),
//         ),
//       ),
//       actions: trailing,
//       centerTitle: true,
//       title: Padding(
//         padding: EdgeInsets.all(3.w),
//         child: Text(
//           title.toUpperCase(),
//           style: TextStyle(
//             overflow: TextOverflow.visible,
//             fontSize: 20.sp,
//           ),
//         ),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(50);
// }


