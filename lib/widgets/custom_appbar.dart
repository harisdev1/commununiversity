import 'package:communiversity/core/home/controller/zoom_drawer_controller.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget customAppBar(
    {required BuildContext context,
    required String title,
    Widget? subWidget,
    String? leadingIconPath,
    double? height,
    bool isActions = false}) {
  return Container(
    width: 1.sw,
    height: height ?? 124.h,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: <Widget>[
        AppBar(
          centerTitle: true,
          backgroundColor: AppColors.cyan,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Transform.scale(
                scale: 0.5,
                child: ImageIcon(
                  AssetImage(leadingIconPath ?? AssetPath.back),
                  color: AppColors.white,
                ),
              ),
            ),
            onTap: () {
              leadingIconPath != null
                  ? MyDrawerController.instance.toggleDrawer()
                  : Get.back();
            },
          ),
          primary: false,
          title: Text(title),
          actions: isActions
              ? <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                    ),
                    onPressed: () {},
                  )
                ]
              : null,
        ),
        subWidget ?? Container(),
      ],
    ),
  );
}

// class CustomAppBar extends StatelessWidget {
//   final String? title;
//   final IconData? leadingIcon;
//   final Widget? subWidget;
//   final BuildContext appbarContext;
//   CustomAppBar(
//       {Key? key,
//       this.title,
//       this.leadingIcon,
//       this.subWidget,
//       required this.appbarContext})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 1.sw,
//       height: 124.h,
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: <Widget>[
//           AppBar(
//             centerTitle: true,
//             backgroundColor: AppColors.cyan,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             leading: Builder(builder: (context) {
//               return GestureDetector(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Icon(leadingIcon!),
//                 ),
//                 onTap: () {
//                   ZoomDrawer.of(context)?.toggle();
//                 },
//               );
//             }),
//             primary: false,
//             title: Text(title!),
//             actions: <Widget>[
//               IconButton(
//                 icon: const Icon(
//                   Icons.notifications,
//                 ),
//                 onPressed: () {},
//               )
//             ],
//           ),
//           subWidget ?? Container(),
//         ],
//       ),
//     );
//   }
// }