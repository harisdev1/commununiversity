// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:communiversity/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  String? label;
  String? hintText;
  TextEditingController? textController;
  bool? isPasswordField;
  bool? isSuffixIcon;
  bool isReadOnly;
  bool isCenterText;
  IconData? prefixIcon;
  String? Function(String?)? fieldValidator;
  String? Function(String?)? onSaved;
  String? initialVal;
  TextInputType? fieldType;

  void Function(String)? onChanged;
  CustomTextfield({
    this.label,
    this.prefixIcon,
    this.isReadOnly = false,
    this.textController,
    this.hintText,
    this.initialVal,
    this.isSuffixIcon,
    this.fieldType = TextInputType.text,
    this.fieldValidator,
    this.onSaved,
    this.isPasswordField = false,
    this.isCenterText = false,
    this.onChanged,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isvisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.dimWhite,
          ),
          height: 55.h,
        ),
        Padding(
          padding:  EdgeInsets.only(
            top: 10.h,
          ),
          child: TextFormField(
            readOnly: widget.isReadOnly,
            initialValue: widget.initialVal,
            textAlign: widget.isCenterText ? TextAlign.center : TextAlign.left,
            keyboardType: widget.fieldType,
            validator: widget.fieldValidator,
            obscureText: widget.isPasswordField!,
            controller: widget.textController,
            onSaved: widget.onSaved,
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(widget.prefixIcon),
              label: widget.label != null ? Text(widget.label!) : null,
              suffixIcon: widget.isSuffixIcon ?? false
                  ? GestureDetector(
                      child: Icon(
                        isvisible ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.lightGrey,
                      ),
                      onTap: () {
                        setState(() {
                          isvisible = !isvisible;
                          widget.isPasswordField = !(widget.isPasswordField)!;
                        });
                      },
                    )
                  : null,
              contentPadding:
                  EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontSize: 15.sp,
                color: AppColors.darkGrey,
              ),
              errorStyle: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}
