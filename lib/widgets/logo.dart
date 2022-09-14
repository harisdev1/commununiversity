import 'package:flutter/material.dart';
import '../utils/asset_path.dart';

class Logo extends StatelessWidget {
  final double logoWidth;
  final double logoHeight;

  const Logo({super.key, required this.logoWidth, required this.logoHeight});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPath.logo,
      width: logoWidth,
      height: logoHeight,
    );
  }
}
