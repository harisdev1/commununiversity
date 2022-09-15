import 'package:flutter/material.dart';

class CustomMenuItem {
  final String title;
  final IconData icon;
  const CustomMenuItem(this.title, this.icon);
}

class MenuItems {
  static const home = CustomMenuItem('Home', Icons.payment_rounded);
  static const tarHeelTracks =
      CustomMenuItem('Tar Heel Tracks', Icons.format_paint);
  static const myMessages = CustomMenuItem('My Messages', Icons.message);
  static const favourites = CustomMenuItem('Favouites', Icons.favorite_outline);
  static const settings = CustomMenuItem('Settings', Icons.settings);
  static const termsAndConditions =
      CustomMenuItem('Terms & Conditions', Icons.book);
  static const privacyPolicy =
      CustomMenuItem('Privacy Policy', Icons.privacy_tip);
  static const signOut = CustomMenuItem('SignOut', Icons.logout);

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
