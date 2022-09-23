// ignore_for_file: no_duplicate_case_values

import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/core/home/controller/zoom_drawer_controller.dart';
import 'package:communiversity/core/home/model/menu_item.dart';

import 'package:communiversity/core/home/view/menu_page.dart';
import 'package:communiversity/core/my_coins/view/my_coins_page.dart';
import 'package:communiversity/screens/favourites.dart';
import 'package:communiversity/screens/my_messages.dart';
import 'package:communiversity/screens/privacy_policy.dart';
import 'package:communiversity/screens/settings.dart';
import 'package:communiversity/screens/terms_and_consitions.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/widgets/scaffold_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class ZoomDrawerWidget extends StatefulWidget {
  const ZoomDrawerWidget({Key? key}) : super(key: key);

  @override
  State<ZoomDrawerWidget> createState() => _ZoomDrawerWidgetState();
}

class _ZoomDrawerWidgetState extends State<ZoomDrawerWidget> {
  CustomMenuItem currentItem = MenuItems.home;
  //final zoomDrawerController = Get.put(MyDrawerController);
  @override
  Widget build(BuildContext context) {
    Widget? getScreen() {
      switch (currentItem) {
        case MenuItems.home:
          MyDrawerController.instance.toggleDrawer();
          break;
        case MenuItems.favourites:

          return FavouritesPage();

        case MenuItems.tarHeelTracks:
          return MyCoinsPage();
        case MenuItems.settings:
          return SettingsPage();
        case MenuItems.myMessages:
          return MyMesagesPage();
        case MenuItems.termsAndConditions:
          return TermsAndConditonsPage();
        case MenuItems.privacyPolicy:
          return PrivacyPolicyPage();
        case MenuItems.signOut:
          return LoginPage();
      }
    }

    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (_) {
        return ZoomDrawer(
          controller: _.zoomDrawerController,
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
                Get.to(getScreen());
              }),
          mainScreen: ScaffoldWrapper(),
          borderRadius: 24.0,
          disableDragGesture: true,
          androidCloseOnBackTap: true,
          mainScreenTapClose: true,
        );
      },
    );
  }
}

Widget CheckScreen() => const Scaffold(
      body: Center(
        child: Text('Promos'),
      ),
    );
