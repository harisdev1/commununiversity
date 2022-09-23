// ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'dart:io';

import 'package:communiversity/services/api_service.dart';
import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:communiversity/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void checkLogin() async {
    Map<String, dynamic> login_data = {
      "user_email": "hh22@gmail.com",
      "user_password": "1234",
      "user_device_token": "jk545",
      "user_device_type": "Android",
      "latitude": "WE",
      "longitude": "1234"
      // "user_name": 'h@g.com',
      // "user_password": 'hhgggh',
      // "user_device_type": Platform.isIOS ? "ios" : "android",
      // "user_device_token": "dfddfddf"
    };
    var response = await DioClient().postRequest(
      endPoint: NetworkStrings.loginEndpoint,
      data: login_data,
    );
    var jsonResponse = response!.data;
    print(jsonResponse);
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      Get.snackbar("Success", '');
    } else {
      Get.snackbar("Failed", jsonResponse['message']);
    }
  }

  //------------
}
