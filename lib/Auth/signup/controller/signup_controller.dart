import 'package:communiversity/services/dio_client/dio_client.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  late TextEditingController nameController,
      emailController,
      passwordController,
      confirmPasswordController;

  var name = '';
  var email = '';
  var password = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
  }

  void checkSignUp() async {
    final isValid = signupFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      signupFormKey.currentState!.save();
      try {
        print('form Valid');
        final Map<String, dynamic> signupData = <String, dynamic>{
          "user_name": "hhhh",
          "user_email": "h21@gmail.com",
          "user_program": "SE",
          "address": "A357 Block I",
          "user_password": "1234",
          "confirm_password": "1234",
          "bio": "Sama"
        };
        var response = await DioClient().postRequest(
          endPoint: NetworkStrings.signupEndpoint,
          data: signupData,
        );
        var jsonResponse = response!.data;
        if (response.statusCode == NetworkStrings.SUCCESS_CREATED_CODE) {
          Get.snackbar("SignUP SuccessFUlly", '');
        } else {
          Get.snackbar("Failed", "");
        }
      } catch (e) {
        print(e);
      } finally {}
    }
  }
}
