import 'dart:async';
import 'dart:io';
import 'package:communiversity/services/connectivity_manager.dart';
import 'package:communiversity/utils/network_strings.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

class DioClient {
  static Dio? _dio;
  static DioClient? _dioClient;
  static ConnectivityManager? _connectivityManager;
  static CancelToken? _cancelToken;
  DioClient._createInstance();
  factory DioClient() {
    // factory with constructor, return some value
    if (_dioClient == null) {
      _dioClient = DioClient
          ._createInstance(); // This is executed only once, singleton object
      _getDio();
      _connectivityManager = ConnectivityManager();
      _cancelToken ??= CancelToken();
    }
    return _dioClient!;
  }
  static void _getDio() {
    _dio ??= Dio();
    (_dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
  }

  ///-------------------- Get Request -------------------- ///
  Future<Response?> getRequest({
    String? endPoint,
    bool? isLoader,
    Map<String, dynamic>? queryParameters,
    bool? isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      try {
        response = await _dio!.get(NetworkStrings.apiBaseUrl + endPoint!,
            queryParameters: queryParameters,
            cancelToken: _cancelToken, options: Options(
                //headers: _setHeader(isHeaderRequire: isHeaderRequire),
                validateStatus: (status) {
          return status! < 1000;
        }
                // sendTimeout: 90,
                ));
      } on TimeoutException catch (e) {
        print("$endPoint TimeOut: " + e.message!);
      }
    } else {}
    return response;
  }

  ///-------------------- Post Request -------------------- ///
  Future<Response?> postRequest({
    String? endPoint,
    dynamic data,
    bool? isHeaderRequire,
  }) async {
    Response? response;
    if (await _connectivityManager!.isInternetConnected()) {
      try {
        response = await _dio!.post(NetworkStrings.apiBaseUrl + endPoint!,
            data: data, cancelToken: _cancelToken, options: Options(
                // headers: _setHeader(isHeaderRequire: isHeaderRequire),
                validateStatus: (status) {
          return status! < 1000;
        }
                //   sendTimeout: 90,
                ));
      } on TimeoutException catch (e) {
        print("$endPoint TimeOut: " + e.message!);
      }
    } else {}
    return response;
  }

//   ///-------------------- Post Form Request -------------------- ///
//   Future<Response?> postFormRequest(
//       {String? endPoint, dynamic data, bool? isHeaderRequire, var file}) async {
//     Response? response;
//     if (await _connectivityManager!.isInternetConnected()) {
//       try {
//         var formData;
//         formData = FormData.fromMap({
//           "file": await MultipartFile.fromFile(file, filename: 'aa'),
//         });
//         response = await _dio!.post(NetworkStrings.apiBaseUrl + endPoint!,
//             data: formData,
//             cancelToken: _cancelToken,
//             options: Options(
//                 headers: _setHeader(isHeaderRequire: isHeaderRequire),
//                 sendTimeout: 90,
//                 validateStatus: (status) {
//                   return status! < 1000;
//                 }));
//       } on TimeoutException catch (e) {
//         print("$endPoint TimeOut: " + e.message!);
//       }
//     } else {}
//     return response;
//   }

  //-------------------- Set Header --------------------
//   _setHeader({bool? isHeaderRequire}) {
//     if (isHeaderRequire == true) {
//       String? token = token_bearer;
//       return {
//         'Accept': Constants.ACCEPT,
//         'Authorization': "Bearer $token",
//       };
//     } else {
//       return {
//         'Accept': Constants.ACCEPT,
//       };
//     }
//   }
  // //-------------------- Validate Response -------------------- ///
  // Future<void> validateResponse(
  //     {Response? response, ResponseListener? responseListener, bool message=false}) async {
  //   if (response != null) {
  //     var jsonResponse = response.data;
  //     log(jsonResponse.toString());
  //
  //     if (jsonResponse != null) {
  //       if (jsonResponse['message'] != null && message==true)
  //         Utils.showToast(message: jsonResponse['message']);
  //
  //       if (response.statusCode == Constants.SUCCESS_CODE) {
  //         if (jsonResponse['status'] == Constants.API_SUCCESS_STATUS) {
  //           // When Status Code is 200 and api_status is 1
  //           if (responseListener != null) {
  //             responseListener.onSuccess(response: jsonResponse);
  //           }
  //         } else {
  //           // When Status Code is 200 and api_status is 0
  //           if (responseListener != null) {
  //             responseListener.onFailure(response: jsonResponse);
  //           }
  //         }
  //       } else {
  //         // When Status Code is not 200
  //         if (responseListener != null) {
  //           responseListener.onFailure(response: jsonResponse);
  //         }
  //         log(response.statusCode.toString());
  //       }
  //     }
  //   }
  // }
  ///----------------Validate Response------------------///
  // Future<void> validateResponse(
  //     {Response? response, Function? bodyFunction,  }) async {
  //   if (response != null) {
  //     var jsonResponse = response.data;
  //     if (jsonResponse != null) {
  //       if (jsonResponse['message'] != null) {
  //         Utils.showToast(message: jsonResponse['message']);
  //         // BaseServiceUI().showFlushBar(context, jsonResponse['message']);
  //       }
  //       if (response.statusCode == Constants.SUCCESS_CODE) {
  //         if (jsonResponse['status'] == Constants.API_SUCCESS_STATUS) {
  //           // When Status Code is 200 and api_status is 1
  //           bodyFunction!();
  //         }
  //       }
  //       else{
  //         Utils.showToast(message: jsonResponse['message']);
  //       }
  //     }
  //   }
  // }
  ///-------------------- No Internet Connection -------------------- ///
  // void _noInternetConnection({ResponseListener? responseListener, }) {
  //   // Call Failure Listener
  //   if (responseListener != null) {
  //     responseListener.onFailure(response: {});
  //   }
  //   // Display Error Message
  //   Utils.showToast(message: "NO INTERNET");
  //   // BaseServiceUI().showFlushBar(context, Strings.NO_INTERNET);
  // }
  ///-------------------- On TimeOut -------------------- ///
  // void _onTimeOut({String? message, ResponseListener? responseListener, }) {
  //   // Call Failure Listener
  //   if (responseListener != null) {
  //     responseListener.onFailure(response: {});
  //   }
  //   // Display Error Message
  //   Utils.showToast(message: message);
  //   // BaseServiceUI().showFlushBar(context, message);
  // }
}
