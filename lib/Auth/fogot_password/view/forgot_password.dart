// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_strings.dart';
// import '../../../utils/field_validators.dart';
// import '../../../widgets/center_logo.dart';
// import '../../../widgets/custom_text.dart';
// import '../../../widgets/simple_button.dart';
// bool isForget  =false;
// class ForgotPassword extends StatelessWidget {
//    ForgotPassword({Key? key}) : super(key: key);
//    final controller = Get.put(ForgotPasswordController());
//   @override
//   Widget build(BuildContext context) {
//     return BackgroundImageWidget(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           child: Form(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             key: controller.forgotPasswordFormKey,
//             child: Column(
//               //crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 120.h),
//                 CenterLogo(
//                   logoWidth: 150.w,
//                   logoHeight: 150.w,
//                 ),
//                 SizedBox(height: 30.h),
//                 CustomText(
//                   fontSize: 17.sp,
//                   text: AppStrings.forgotPassword.toUpperCase(),
//                   color: Colors.white,
//                 ),
//                 SizedBox(height: 10.h),
//                 CustomTextfield(
//                   hint_Text: AppStrings.enterEmailAddress,
//                   onSaved: (value) {
//                     controller.email = value!;
//                   },
//                   fieldValidator: (value) {
//                     return FieldValidator.validateEmail(value!);
//                   },
//                 ),
//                 SizedBox(height: 7.h),
//                 SimpleButton(
//                   button_color: AppColors.blackColor,
//                   button_label: AppStrings.getCode.toUpperCase(),
//                   onButtonPressed: () {
//                     isForget =true;
//                     controller.checkEmail();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
