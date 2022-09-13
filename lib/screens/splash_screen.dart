// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:entry/entry.dart';
import '../widgets/center_logo.dart';

final box = GetStorage();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(Login());
      // if (box.read('token') != null) {
      //   Logger().e(box.read('token'));
      //   Get.off(Home());
      // } else {
      //   Logger().e(box.read('token'));
      //   Get.off(LoginMethod());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AssetPath.topLeftSvg,
            width: 0.7.sw,
          ),
          _animatedLogo(),
          Spacer(),
          Image.asset(
            AssetPath.bottomSvg,
            width: double.infinity,
            scale: 3,
          ),
        ],
      ),
    );
  }
}

Widget _animatedLogo() {
  return Center(
    child: Entry(
      xOffset: -1000,
      scale: 20,
      delay: Duration(milliseconds: 300),
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
      child: Entry(
        opacity: .5,
        angle: 3.1415,
        scale: .5,
        delay: Duration(milliseconds: 900),
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
        child: Logo(
          logoWidth: 350.w,
          logoHeight: 350.w,
        ),
      ),
    ),
  );
}
