import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/core/home/view/home_page.dart';
import 'package:communiversity/core/home/widgets/zoom_drawer.dart';
import 'package:communiversity/screens/profile.dart';
import 'package:communiversity/screens/splash_screen.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/app_strings.dart';
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
    HomePage(),
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
            resizeToAvoidBottomInset: false,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  appbarContext: context,
                  title: 'Home',
                  leadingIcon: Icons.menu,
                  subWidget: Positioned(
                    top: 0.10.sh,
                    left: 20.w,
                    right: 20.w,
                    child: CustomTextfield(
                      hintText: AppStrings.search,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),

                //   pages.elementAt(_selectedIndex),
              ],
            ),
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
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.man)),
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
