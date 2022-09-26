// ignore_for_file: constant_identifier_names

class NetworkStrings {
  NetworkStrings._();
  //------------------------- Base URLS ------------------------------------

  static const String apiBaseUrl = "https://server.appsstaging.com:3088/api/";
  static const String imageBaseUrl = "https://server.appsstaging.com:/3088";

//-------------------------------- AUTH-----------------------------------
  static const String signupEndpoint = "signup";
  static const String loginEndpoint = "login";
  static const String forgotPasswordEndpoint = "forgetPassword";
  static const String verifyOtpEndpoint = "OTPverification";
  static const String resetPasswordEndpoint = "resetPassword";
  static const String resendCodeEndpoint = "resendCode";
  static const String socialLoginEndpoint = "socialLogin";
  static const String logoutEndPoint = "logout";
  static const String updatePasswordEndPoint = "updatePassword";
  static const String getUserEndPoint = "getprofile";
  static const String updateProfileEndPoint = "updateprofile";

  //---------------- Cars------------------------//
  static const String allCars = "allCars";
  static const String deleteCarEndPoint = "deleteCar";

//----------------  Fuel------------------------//
  static const String addFuelEndPoint = "addFuel";
  static const String getFuelEndPoint = "getFuel/";
  static const String calculateFuelEndPoint = "calFuel";

//-----------------  Stats --------------------//
  static const String getByMonth = "getByMonth";

//------------------- History-------------------//
  static const String history = "getHistory";

//------------------ User Guidelines----------------
  static const String privacyPolicy = "get-content/privacy_policy";
  static const String termsAndConditions = "get-content/terms_and_conditions";

//----------API STATUS CODE-----------------//

  static const int SUCCESS_CODE = 200;
  static const int SUCCESS_CREATED_CODE = 201;

  static const int UNAUTHORIZED_CODE = 401;

//--------------------Defgault ----------------

  static const String defaultAvatar =
      "https://cdn-icons-png.flaticon.com/512/147/147144.png";

  //---------- API MESSAGES ------------------//

  // static const int API_SUCCESS_STATUS = 1;
  // static const int EMAIL_UNVERIFIED = 0;
  // static const int EMAIL_VERIFIED = 1;
  // static const int PROFILE_INCOMPLETED = 0;
  // static const int PROFILE_COMPLETED = 1;
}
