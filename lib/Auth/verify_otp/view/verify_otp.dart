// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'package:communiversity/Auth/verify_otp/controller/verify_otp_controller.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/utils/themes.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:communiversity/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _pinCodeField() => PinCodeTextField(
          appContext: context,
          pastedTextStyle: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              //  return "I'm from validator";
              return null;
            } else {
              return null;
            }
          },
          pinTheme: Themes.pinCodeFieldTheme,
          cursorColor: AppColors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          // controller: textEditingController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (v) => debugPrint("Completed"),
          onTap: () => debugPrint("Pressed"),
          onChanged: (value) => debugPrint(value),
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            return true;
          },
        );

    Widget _verifyOtpForm() => Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: VerifyOtpController.i.verifyOtpFormKey,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              _pinCodeField(),
              SizedBox(height: 41.h),
              Image.asset(AssetPath.clock),
              SizedBox(height: 19.h),
              CustomText(fontSize: 20.sp, text: '00:59', color: AppColors.cyan),
              SizedBox(height: 50.h),
              SimpleButton(
                button_color: AppColors.cyan,
                button_label: AppStrings.verify.toUpperCase(),
                onButtonPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  VerifyOtpController.i.checkOtp();
                },
              ),
            ],
          ),
        );

    return Scaffold(
      body: CustomNestedScrollView(
        child: _verifyOtpForm(),
        horizontalPadding: 30.w,
        title: 'OTP Verification',
        background: Image.asset(
          AssetPath.login,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
