// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:communiversity/Auth/login/view/login.dart';
import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:communiversity/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  late TextEditingController passwordController, confirmPasswordController;
  static ResetPasswordController get i => Get.find();

  var password = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void checkResetPassword() async {
    final isValid = resetPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      try {
        resetPasswordFormKey.currentState!.save();
        final Map<String, dynamic> resetPasswordData = <String, dynamic>{
          "user_id": "6331834b8a0093437e4b2a08",
          "user_password": "12345"
        };
        var response = await DioClient().postRequest(
          endPoint: NetworkStrings.resetPasswordEndpoint,
          data: resetPasswordData,
        );
        //  var jsonResponse = response!.data;
        if (response!.statusCode == NetworkStrings.SUCCESS_CODE) {
          Get.snackbar("Success", '');
          Get.to(const LoginPage());
        } else {
          Get.snackbar("Failed", "");
        }
      } catch (_) {
        customSnackBar(AppStrings.somethingWentWrong);
      }
    }
  }
}
