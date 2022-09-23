import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            const Spacer(flex: 1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(AssetPath.login),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        if(true)...[
                              
                        ],
                      CustomText(
                        fontSize: 25.sp,
                        text: 'Joe Brewer',
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        fontSize: 10.sp,
                        color: AppColors.white,
                        text:
                            'Joebrewer@domain.com\n1234 Lorem Street Dummy Address\nLos Angeles Us',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            // const Spacer(flex: 2),
            ...MenuItems.all.map(buildMenuItems).toList(),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(CustomMenuItem item) => Container(
        constraints: BoxConstraints(
          maxWidth: 240.w,
        ),
        // width: 200.w,
        child: ListTile(
          selectedTileColor: Colors.black.withOpacity(0.1),
          selectedColor: AppColors.white,
          selected: currentItem == item,
          minLeadingWidth: 20,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          leading: ImageIcon(item.iconImage),
          title: Text(item.title),
          onTap: () => onSelectedItem(item),
        ),
      );
}
