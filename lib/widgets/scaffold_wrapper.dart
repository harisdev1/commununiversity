// ignore_for_file: prefer_const_constructors

import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/core/games/games_page.dart';
import 'package:communiversity/core/home/view/home_page.dart';
import 'package:communiversity/core/home/widgets/zoom_drawer.dart';
import 'package:communiversity/screens/edit_profile.dart';
import 'package:communiversity/screens/profile.dart';
import 'package:communiversity/screens/splash_screen.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_appbar.dart';
import 'package:communiversity/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWrapper extends StatefulWidget {
  ScaffoldWrapper({Key? key}) : super(key: key);

  @override
  State<ScaffoldWrapper> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> {
  List<Widget> pages = <Widget>[
    HomePage(),
    GamesPage(),
    HomePage(),
    ProfilePage(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: pages.elementAt(_selectedIndex),
            bottomNavigationBar: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: AppColors.cyan,
              onTap: (_) {
                setState(() {
                  _selectedIndex = DefaultTabController.of(context)!.index;
                  print(DefaultTabController.of(context)!.index);
                });
              },
              indicator: CustomIndicator(),
              tabs: const [
                Tab(icon: ImageIcon(AssetImage(AssetPath.home))),
                Tab(icon: ImageIcon(AssetImage(AssetPath.game))),
                Tab(icon: ImageIcon(AssetImage(AssetPath.event))),
                Tab(icon: ImageIcon(AssetImage(AssetPath.profile))),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([void Function()? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint paint = Paint()
      ..color = AppColors.cyan
      ..strokeWidth = 5
      ..isAntiAlias = true;
    canvas.drawLine(offset, Offset((cfg.size?.width)! + offset.dx, 0), paint);
  }
}
