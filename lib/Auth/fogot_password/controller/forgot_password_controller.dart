// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_const_constructors

import 'package:communiversity/Auth/verify_otp/view/verify_otp.dart';
import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  var email = '';
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  void checkEmail() async {
    final isValid = forgotPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      try {
        forgotPasswordFormKey.currentState!.save();
        final Map<String, dynamic> forgetPasswordData = <String, dynamic>{
          "user_email": "hh22@gmail.com"
        };
        var response = await DioClient().postRequest(
          endPoint: NetworkStrings.forgotPasswordEndpoint,
          data: forgetPasswordData,
        );
        var jsonResponse = response!.data;
        if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
          Get.snackbar("Success", '');
          Get.to(VerifyOtpPage());
        } else {
          Get.snackbar("Failed", jsonResponse['message']);
        }
      } catch (e) {}
    }
  }
}
