// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:communiversity/Widgets/custom_text.dart';
import 'package:communiversity/utils/app_colors.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownField extends StatelessWidget {
  List? Items;
  String? value;
  Function(String?)? onchange;
  CustomDropdownField({Key? key, this.Items, this.onchange, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(35),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          value: value,
          isExpanded: true,
          icon: Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: const Icon(Icons.keyboard_arrow_down),
          ),
          elevation: 16,
          onChanged: onchange,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 10.w),
              child: Transform.scale(
                scale: 1,
                child: const ImageIcon(
                  AssetImage(AssetPath.graduate),
                ),
              ),
            ),
            border: InputBorder.none,
            label: const Text(
              "Choose Program",
            ),
          ),
          items: Items!.map<DropdownMenuItem<String>>((dynamic item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 15.sp),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
