import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomNestedScrollView extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget background;
  final double? horizontalPadding;
  final double? verticalPadding;

  const CustomNestedScrollView({
    Key? key,
    required this.child,
    this.title,
    required this.background,
    this.horizontalPadding = 0.0,
    this.verticalPadding = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: CustomSliverAppBar(title: title, background: background),
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding!,
            vertical: verticalPadding!,
          ),
          child: child,
        ),
      ),
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    this.title,
    required this.background,
  }) : super(key: key);

  final String? title;
  final Widget background;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 270.h,
      floating: true,
      pinned: true,
      centerTitle: true,
      leading: IconButton(
        icon: const ImageIcon(
          AssetImage(AssetPath.back),
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: title != null ? CustomText(fontSize: 20.sp, text: title!) : null,
      flexibleSpace: FlexibleSpaceBar(
        background: background,
      ),
    );
  }
}
