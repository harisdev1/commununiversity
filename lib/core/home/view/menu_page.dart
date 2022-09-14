import 'package:communiversity/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../model/menu_item.dart';

class MenuPage extends StatelessWidget {
  final CustomMenuItem currentItem;
  final ValueChanged<CustomMenuItem> onSelectedItem;

  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: AppColors.cyan,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ...MenuItems.all.map(buildMenuItems).toList(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(CustomMenuItem item) => ListTileTheme(
        selectedColor: AppColors.white,
        child: ListTile(
          selectedTileColor: Colors.black.withOpacity(0.1),
          selected: currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}
