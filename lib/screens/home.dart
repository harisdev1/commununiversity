import 'package:communiversity/screens/splash_screen.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerWidget extends StatelessWidget {
  const ZoomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZoomDrawer(
        menuScreenWidth: 1.sw,
        menuBackgroundColor: AppColors.cyan,
        style: DrawerStyle.defaultStyle,
        menuScreen: const MenuScreen(),
        mainScreen: Home(),
        borderRadius: 24.0,
        disableDragGesture: true,
        androidCloseOnBackTap: true,
        mainScreenTapClose: true,
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height, context),
      body: ListView(),
    );
  }
}

_appBar(height, BuildContext context) => PreferredSize(
      preferredSize: Size(1.sw, height + 50.h),
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
            top: 75.h,
            left: 20.w,
            right: 20.w,
            child: CustomTextfield(
              hintText: AppStrings.search,
            ),
          ),
        ],
      ),
    );

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.cyan,
    );
  }
}
