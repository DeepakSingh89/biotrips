import 'dart:developer';

import 'package:biotrips/helpers/common_loader.dart';
import 'package:dio/dio.dart';

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
        log("OTP $response");
      } else {
        CommonLoader.showErrorDialog(description: response.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
    }
  }
}
