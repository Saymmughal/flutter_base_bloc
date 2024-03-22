import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/helper/routes_helper.dart';
import 'package:flutter_base_bloc/main.dart';
import 'package:flutter_base_bloc/view/widgets/extention/object_extension.dart';
import '../db/shared-preferences.dart';
import 'api_exception.dart';
import 'dart:async';

class ApiRepo {
  /*
***************************** TimeOut ***********************************
    sendTimeout: const Duration(milliseconds:300000),
    receiveTimeout: const Duration(milliseconds:300000),
     connectTimeout: const Duration(milliseconds: 300000),

************************ For Error Response *****************************
    receiveDataWhenStatusError: true,

***************************** Headers ***********************************
    HttpHeaders.authorizationHeader : "Bearer $token"
    HttpHeaders.contentTypeHeader : "application/json"
    HttpHeaders.acceptEncodingHeader: "*"
*/

  // Dio Initialization
  Dio dio = Dio();

  // Set BaseOption for Api Request
  Future<void> dioOption({required Map<String, dynamic> headers}) async {
    try {
      dio.options = BaseOptions(
          connectTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          receiveDataWhenStatusError: true,
          headers: headers);
    } catch (e) {
      "Error $e".printLog;
    }
  }

  // ======================================================================
  //POST REQUEST
  // Getting four parameters
  // context => use for loader and navigation
  // screen =>  router name
  // url => url of the api
  // Map data => json data for api

  postRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Post Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // Convert json (Map) to form data
    // var formData = FormData.fromMap(data);

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.post(url, data: data);

      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // GET REQUEST
  getRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Get Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.get(url, queryParameters: data);

      // return response back
      return response;
    } on DioException catch (exception) {
      //If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // PUT REQUEST
  putRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Put Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.put(url, queryParameters: data);
      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // DELETE REQUEST
  deleteRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Delete Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.delete(url, queryParameters: data);

      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // POST MULTIPART REQUEST
  //POST MULTIPART REQUEST
  //When we are uploading Media  like (image,file,video,audio,etc)
  //then we are using multipart request

  multipartRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Multipart Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // Convert json (Map) to form data
    var formData = FormData.fromMap(data);

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "multipart/form-data",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.post(url, data: formData);

      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // DOWNLOAD REQUEST
  downloadRequest(String screen, String url, String savePath, {Object? arguments}) async {
    debugPrint("Download Request=====================>>> \n URl : $url");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    int? percentage;
    try {
      // Calling Api
      final response = await Dio().download(
        url,
        savePath,
        onReceiveProgress: (rec, total) {
          // set progress to percentage variable
          percentage = ((rec / total) * 100).floor();
          "Percentage : $percentage".printLog;
        },
      );

      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // Patch REQUEST
  // Getting four parameters
  // context => use for loader and navigation
  // screen =>  router name
  // url => url of the api
  // Map data => json data for api

  patchRequest(String screen, String url, Map<String, dynamic> data, {Object? arguments}) async {
    debugPrint(
        "Patch Request=====================>>> \n URl : $url \n Sending data : $data");

    // Get the bearer token which we have stored in sharedPreferences before
    String? bearerToken = await LocalDb.getBearerToken;
    debugPrint("Bearer token=====================>>>\n Token:$bearerToken");

    // Convert json (Map) to form data
    // var formData = FormData.fromMap(data);

    // calling dioOption method to set base options
    await dioOption(headers: {
      HttpHeaders.authorizationHeader: "Bearer $bearerToken",
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptEncodingHeader: "*",
      HttpHeaders.acceptHeader: "application/json"
    });

    try {
      // Calling Api
      final response = await dio.patch(url, data: data);

      // return response back
      return response;
    } on DioException catch (exception) {
      // If Exception Occur calling dioError method to Handle the Exception
      return dioError(exception, screen, arguments: arguments);
    }
  }

  // ======================================================================
  // Error Handling

  Future<dynamic> dioError(DioException exception, String screen, {Object? arguments}) async {
    // if response is 400 OR 401 then we will return back API response otherwise we will navigate to  Error Screen
    debugPrint(
        "Exception Response ===================> ${exception.response!.data}");
    if (exception.type == DioExceptionType.badResponse) {
      if (exception.response!.statusCode == 401) {
        Future.delayed(Duration.zero, () {
          LocalDb.resetSharedPreference;
          navigatorKey.currentState!.pushNamedAndRemoveUntil(
              RouterHelper.logInScreen, (route) => false);
        });
      }
    }
    await Future.delayed(Duration.zero, () {
      apiException(exception, screen, arguments: arguments);
    });
  }
}
