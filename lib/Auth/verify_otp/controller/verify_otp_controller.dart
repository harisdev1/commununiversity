// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors, curly_braces_in_flow_control_structures
import 'dart:async';
import 'package:communiversity/Auth/fogot_password/view/forgot_password.dart';
import 'package:communiversity/Auth/reset_password/view/reset_password.dart';
import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:communiversity/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final GlobalKey<FormState> verifyOtpFormKey = GlobalKey<FormState>();
  late TextEditingController otpController;
  static VerifyOtpController get i => Get.find();

  var otp = '';
  static var count = 10;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    StartTime();
    otpController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    otpController.dispose();
  }

  void checkOtp() async {
    final isValid = verifyOtpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      try {
        verifyOtpFormKey.currentState!.save();
        final Map<String, dynamic> verifyOtpData = <String, dynamic>{
          "user_id": "632c0f7901736e2b8e6e5fcc",
          "verificationcode": 123456
        };
        var response = await DioClient().postRequest(
          endPoint: NetworkStrings.verifyOtpEndpoint,
          data: verifyOtpData,
        );
        var jsonResponse = response!.data;
        if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
          Get.snackbar("OTP Verified", '');
          Get.to(ResetPasswordPage());
        } else {
          Get.snackbar("Failed", jsonResponse['message']);
        }
      } catch (_) {
        customSnackBar(AppStrings.somethingWentWrong);
      }
    }
  }

  void StartTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (count > 0) {
        count--;
        update();
      } else
        _timer.cancel();
      update();
    });
  }

  void reset() {
    _timer.cancel();
    count = 30;
    update();
    StartTime();
    resendOtp();
  }

//---------------- Resend Otp-----------------------

  void resendOtp() async {
    try {} catch (_) {
      customSnackBar(AppStrings.somethingWentWrong);
    }
  }
}

  //------------

