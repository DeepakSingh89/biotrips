import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class Client {
  static String token = "token";
  static String userId = "";
  static String baseUser = "https://api.biotrips.in/api/user/verifyOTP/$userId";
  static String profileUrl = "";
  static String profileId =
      "https://api.biotrips.in/api/user/employee/$profileUrl";

  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = "https://api.biotrips.in";
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    GetStorage box = GetStorage();
    var token = await box.read("token");
    var profileUrl = await box.read("profileUrl");
    if (token != null && profileUrl != null) {
      // ignore: prefer_interpolation_to_compose_strings
      options.headers["Authorization"] = "Bearer " + token;
      options.queryParameters["Authorization"] = "Bearer" + profileUrl;
      log("header $profileUrl");
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
