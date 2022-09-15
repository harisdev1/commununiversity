import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final IconData? leadingIcon;
  final Widget? subWidget;
  final BuildContext appbarContext;
  CustomAppBar(
      {Key? key,
      this.title,
      this.leadingIcon,
      this.subWidget,
      required this.appbarContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                builder: (BuildContext cc) => GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(leadingIcon!),
                  ),
                  onTap: () {
                    ZoomDrawer.of(cc)?.toggle();
                  },
                ),
              ),
              primary: false,
              title: Text(title!),
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
          subWidget ?? Container(),
        ],
      ),
    );
  }
}
