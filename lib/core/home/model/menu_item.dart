import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';

class CustomMenuItem {
  final String title;
  final AssetImage iconImage;
  const CustomMenuItem(this.title, this.iconImage);
}

class MenuItems {
  static const home = CustomMenuItem(
    'Home',
    AssetImage(AssetPath.home),
  );
  static const tarHeelTracks = CustomMenuItem(
    'Tar Heel Tracks',
    AssetImage(AssetPath.heel),
  );
  static const myMessages = CustomMenuItem(
    'My Messages',
    AssetImage(AssetPath.message),
  );
  static const favourites = CustomMenuItem(
    'Favouites',
    AssetImage(AssetPath.favourite),
  );
  static const settings = CustomMenuItem(
    'Settings',
    AssetImage(AssetPath.settings),
  );
  static const termsAndConditions = CustomMenuItem(
    'Terms & Conditions',
    AssetImage(AssetPath.termsAndConditions),
  );
  static const privacyPolicy = CustomMenuItem(
    'Privacy Policy',
    AssetImage(AssetPath.privacyPolicy),
  );
  static const signOut = CustomMenuItem(
    'SignOut',
    AssetImage(AssetPath.signout),
  );

  static const all = <CustomMenuItem>[
    home,
    tarHeelTracks,
    myMessages,
    favourites,
    settings,
    termsAndConditions,
    privacyPolicy,
    signOut,
  ];
}
