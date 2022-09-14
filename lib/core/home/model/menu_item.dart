import 'package:flutter/material.dart';

class CustomMenuItem {
  final String title;
  final IconData icon;
  const CustomMenuItem(this.title, this.icon);
}

class MenuItems {
  static const payment = CustomMenuItem('Payment', Icons.payment_rounded);
  static const promos = CustomMenuItem('Promos', Icons.card_giftcard);
  static const help = CustomMenuItem('Help', Icons.help);

  static const all = <CustomMenuItem>[
    payment,
    promos,
    help,
  ];
}
