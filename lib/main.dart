// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:communiversity/bindings.dart';
import 'package:communiversity/core/home/widgets/zoom_drawer.dart';
import 'package:communiversity/screens/splash_screen.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return SafeArea(
          child: GetMaterialApp(
            initialBinding: AppBindings(),
            // builder: (context, child) {
            //   return ScrollConfiguration(
            //     behavior: MyScrollBehavior(),
            //     child: ZoomDrawerWidget(),
            //   );
            // },
            navigatorObservers: [BotToastNavigatorObserver()],
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                    primary: AppColors.cyan,
                  ),
            ),
            title: 'Communiversity',
            debugShowCheckedModeBanner: false,
            home: ZoomDrawerWidget(),
          ),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
