// // ignore_for_file: avoid_print, non_constant_identifier_names, prefer_interpolation_to_compose_strings

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import '../../../services/connectivity_manager.dart';

// dynamic id;
// bool isVerified = false;

// class LoginController extends GetxController {
//   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
//   late TextEditingController emailController, passwordController;
//   final controller = Get.put(updateProfileController());
//   final box = GetStorage();
//   var email = '';
//   var password = '';

//   @override
//   void onInit() {
//     super.onInit();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   void checkLogin() async {
//     final isValid = loginFormKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     } else {
//       ConnectivityManager? _connectivityManager = ConnectivityManager();
//       if (await _connectivityManager.isInternetConnected()) {
//         try {
//           showLoading();
//           loginFormKey.currentState!.save();
//           final Map<String, dynamic> data = <String, dynamic>{};
//           data['user_email'] = email;
//           data['user_password'] = password;
//           var response = await ApiService.post(
//               NetworkStrings.loginEndpoint, data,
//               isHeader: false);
//           var dataInJson = jsonDecode(response.body);
//           if ((response.statusCode == NetworkStrings.SUCCESS_CODE) &&
//               (dataInJson['status'] == 1)) {
//             stopLoading();
//             var obj = LoginResponseModel.fromJson(dataInJson);
//             id = obj.user?.id;
//             if (obj.user?.verified == 1) {
//               customSnackBar(AppStrings.loginSuccessfully);
//               box.write('token', obj.user?.userAuthentication);
//               box.write('verified', obj.user?.verified);
//               box.write('id', obj.user?.id);
//               controller.setFields(
//                   obj.user?.fullName, obj.user?.image, obj.user?.userEmail!);
//               box.write('name', obj.user?.fullName);
//               box.write('email', obj.user?.userEmail);
//               box.write('image', obj.user?.image);
//               isVerified = true;
//               Get.offAll(const Home());
//             } else {
//               customSnackBar(AppStrings.emailNotVerified);
//               Get.off(VerifyOtp(), arguments: [id]);
//               isVerified = false;
//             }
//           } else {
//             stopLoading();
//             customSnackBar(dataInJson['msg']);
//           }
//         } catch (e) {
//           stopLoading();
//           customSnackBar(AppStrings.somethingWentWrong);
//         }
//       } else {
//         stopLoading();
//         customSnackBar(AppStrings.noInternetConnection);
//       }
//     }
//   }

//   //------------
// }
