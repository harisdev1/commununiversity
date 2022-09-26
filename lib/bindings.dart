import 'package:communiversity/Auth/change_password/controller/change_password_controller.dart';
import 'package:communiversity/Auth/fogot_password/controller/forgot_password_controller.dart';
import 'package:communiversity/Auth/fogot_password/view/forgot_password.dart';
import 'package:communiversity/Auth/login/controller/login_controller.dart';
import 'package:communiversity/Auth/reset_password/controller/reset_password_controller.dart';
import 'package:communiversity/Auth/signup/controller/signup_controller.dart';
import 'package:communiversity/Auth/verify_otp/controller/verify_otp_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController(), fenix: true);
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController(),
        fenix: true);
    Get.lazyPut<VerifyOtpController>(() => VerifyOtpController(), fenix: true);
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(),
        fenix: true);
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController(),
        fenix: true);
  }
}
