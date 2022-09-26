// ignore_for_file: prefer_const_constructors
import 'package:communiversity/Auth/fogot_password/view/forgot_password.dart';
import 'package:communiversity/Auth/login/controller/login_controller.dart';
import 'package:communiversity/Auth/signup/view/signup.dart';
import 'package:communiversity/utils/asset_path.dart';
import 'package:communiversity/utils/field_validators.dart';
import 'package:communiversity/widgets/custom_nested_scroll_view.dart';
import 'package:communiversity/widgets/custom_textfield.dart';
import 'package:communiversity/widgets/link_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_strings.dart';
import '../../../widgets/simple_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget _emailField() {
      return CustomTextfield(
        prefixIconName: AssetPath.email,
        label: AppStrings.email,
        textController: LoginController.i.emailController,
        onSaved: (value) {
          LoginController.i.email = value!;
        },
        fieldValidator: (value) {
          return FieldValidator.validateEmail(value!);
        },
      );
    }

    Widget _passwordField() {
      return CustomTextfield(
        prefixIconName: AssetPath.password,
        textController: LoginController.i.passwordController,
        isSuffixIcon: true,
        isPasswordField: true,
        label: AppStrings.password,
        onSaved: (value) {
          LoginController.i.password = value!;
        },
        fieldValidator: (value) {
          return FieldValidator.validatePassword(value!);
        },
      );
    }

    Widget _forgetPasswordLink() {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: LinkWidget(
          linkText: 'Forgot Password',
          onTap: () {
            Get.to(ForgetPasswordPage());
          },
        ),
      );
    }

    Widget _loginButton() {
      return SimpleButton(
        button_label: AppStrings.login.toUpperCase(),
        onButtonPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          LoginController.i.checkLogin();
        },
      );
    }

    Widget _signupLink() {
      return LinkWidget(
        preText: AppStrings.dontHaveAnAccount,
        linkText: 'SignUp',
        onTap: () {
          Get.to(SignupPage());
        },
      );
    }

    Widget _loginForm() {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: LoginController.i.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            _emailField(),
            SizedBox(height: 10.h),
            _passwordField(),
            SizedBox(height: 7.h),
            _forgetPasswordLink(),
            SizedBox(height: 7.h),
            _loginButton(),
            SizedBox(height: 50.h),
            _signupLink(),
          ],
        ),
      );
    }

    return Scaffold(
      body: CustomNestedScrollView(
        horizontalPadding: 30.w,
        title: AppStrings.login,
        background: Image.asset(
          AssetPath.login,
          fit: BoxFit.cover,
        ),
        child: _loginForm(),
      ),
    );
  }
}
