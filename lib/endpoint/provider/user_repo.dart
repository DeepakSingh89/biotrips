import 'dart:developer';

import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/helpers/common_loader.dart';
import 'package:biotrips/view/screens/authentication/verify_otp.dart';
import 'package:biotrips/view/screens/dashboard/dashboard.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';

class UserEndPointRepsitory {
  Dio client;
  UserEndPointRepsitory({required this.client});

  loginApi({required String phoneNo}) async {
    CommonLoader.showLoading();
    try {
      var data = {"phone": phoneNo};
      Response response = await client.post("/api/user/sendOtp", data: data);
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        GetStorage box = GetStorage();
        String userId = response.data['message']['_id'];
        await box.write("userId", userId);
        Client.userId = userId;
        g.Get.to(() => VerifyOtp());
        log("OTP $response");
        log("userId $userId");
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }

  /// verifyOtp
  verifyOtp(String otp) async {
    CommonLoader.showLoading();
    try {
      var data = {"otp": otp};
      Response response = await client.post(Client.baseUser, data: data);
      log("ver ${Client.baseUser}");
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        log("verify $response");
        GetStorage box = GetStorage();
        String token = response.data['data']['token'];
        log("token $token");
        await box.write("token", token);
        Client.token = token;
        await box.remove(Client.userId);
        log("rmove ${Client.userId}");

        // GetStorage box1 = GetStorage();
        String profileUrl = response.data['data']['_id'];
        await box.write("profileUrl", profileUrl);
        Client.profileUrl = profileUrl;
        log("log prof ${Client.profileUrl}");

        g.Get.to(() => Dashboard());
      } else {
        log("verify else $response");
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      log("DioError $e");
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
