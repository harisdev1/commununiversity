import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_listtile.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';

class EventDetailsPage extends StatelessWidget {
  final _pageController = PageController();
  static final _images = [
    AssetPath.login,
    AssetPath.login,
    AssetPath.login,
    AssetPath.login,
  ];

  @override
  Widget build(BuildContext context) {
    Widget _imageView(String image) {
      return Image.asset(image, fit: BoxFit.cover);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(
            background: ScrollPageView(
              //  physics: const NeverScrollableScrollPhysics(),
              controller: ScrollPageController(),
              delay: const Duration(seconds: 3),
              indicatorAlign: Alignment.bottomCenter,
              children: _images.map((image) => _imageView(image)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
