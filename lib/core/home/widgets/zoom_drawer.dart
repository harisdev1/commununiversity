// ignore_for_file: no_duplicate_case_values

import 'package:communiversity/core/home/model/menu_item.dart';
import 'package:communiversity/core/home/view/home_page.dart';
import 'package:communiversity/core/home/view/menu_page.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerWidget extends StatefulWidget {
  const ZoomDrawerWidget({Key? key}) : super(key: key);

  @override
  State<ZoomDrawerWidget> createState() => _ZoomDrawerWidgetState();
}

class _ZoomDrawerWidgetState extends State<ZoomDrawerWidget> {
  CustomMenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreenWidth: 1.sw,
      menuBackgroundColor: AppColors.cyan,
      style: DrawerStyle.defaultStyle,
      slideWidth: 0.8.sw,
      menuScreen: MenuPage(
          currentItem: currentItem,
          onSelectedItem: (item) {
            setState(() {
              currentItem = item;
            });
          }),
      mainScreen: getScreen(),
      borderRadius: 24.0,
      disableDragGesture: true,
      androidCloseOnBackTap: true,
      mainScreenTapClose: true,
    );
  }

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.promos:
        return const Scaffold(
          body: Center(
            child: Text('Promos'),
          ),
        );
      case MenuItems.help:
        return const Scaffold(
          body: Center(
            child: Text('Promos'),
          ),
        );
      default:
        return ScaffoldWrapper();
    }
  }
}
