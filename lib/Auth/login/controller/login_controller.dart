import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find();
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
    Map<String, dynamic> loginData = {
      "user_email": "hh22@gmail.com",
      "user_password": "1234",
      "user_device_token": "jk545",
      "user_device_type": "Android",
      "latitude": "WE",
      "longitude": "1234"
    };
    var response = await DioClient().postRequest(
      endPoint: NetworkStrings.loginEndpoint,
      data: loginData,
    );
    var jsonResponse = response!.data;
    if (response.statusCode == NetworkStrings.SUCCESS_CODE) {
      Get.snackbar("Success", '');
    } else {
      Get.snackbar("Failed", jsonResponse['message']);
    }
  }

  //------------
}
