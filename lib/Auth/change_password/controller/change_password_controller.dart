import 'package:communiversity/utils/app_strings.dart';
import 'package:communiversity/widgets/Custom_SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UpdatePasswordController extends GetxController {
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  late TextEditingController oldpasswordController,
      newpasswordController,
      confirmPasswordController;

  final box = GetStorage();
  var oldpassword = '';
  var newpassword = '';
  var confirmPassword = '';

  @override
  void onInit() {
    super.onInit();
    oldpasswordController = TextEditingController();
    newpasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    oldpasswordController.clear();
    newpasswordController.clear();
    confirmPasswordController.clear();
  }

  void checkUpdatePassword() async {
    final isValid = updatePasswordFormKey.currentState!.validate();
    print('form Not Valid');
    if (!isValid) {
      return;
    } else {
      try {
        updatePasswordFormKey.currentState!.save();
        final Map<String, dynamic> changePasswordData = <String, dynamic>{};
      } catch (_) {
        customSnackBar(AppStrings.somethingWentWrong);
      }
    }
  }
}
