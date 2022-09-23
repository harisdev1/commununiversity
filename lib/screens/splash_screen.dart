// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:entry/entry.dart';
import '../widgets/logo.dart';

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
      Get.off(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _borderBanner(229.57.w, 242.h, AssetPath.topLeftSvg),
          _animatedLogo(),
          SizedBox(height: 60.h),
          _borderBanner(1.sw, 122.78.h, AssetPath.bottomSvg),
        ],
      ),
    );
  }
}

Widget _borderBanner(double width, double height, String assetName) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(assetName),
        ),
      ),
    );

Widget _animatedLogo() {
  return Expanded(
    child: Center(
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
            logoWidth: 286.w,
            logoHeight: 329.h,
          ),
        ),
      ),
    ),
  );
}
