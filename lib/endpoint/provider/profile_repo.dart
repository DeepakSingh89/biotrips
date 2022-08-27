import 'dart:convert';
import 'dart:developer';

import 'package:biotrips/controller/profile_controller.dart';
import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/helpers/common_loader.dart';
import 'package:biotrips/model/profile_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

class ProfileRepository {
  Dio client;
  ProfileRepository({required this.client});

  editProfileApi(String name, String imagePath, String email) async {
    CommonLoader.showLoading();
    var data = {
      "files": imagePath,
      "name": name,
      "email": email,
    };
    try {
      Response response = await client.patch(Client.profileId, data: data);
      log("edip ${Client.profileId}");
      CommonLoader.hideLoading();
      if (response.statusCode == 200) {
        CommonLoader.showSuccessDialog(description: response.data["msg"]);
        log("200 editprofie $response");
        ProfileController controller = g.Get.find();
        controller.getProfile();
      } else {
        log("else editprofie $response");
        CommonLoader.showErrorDialog(description: response.data["error"]);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      CommonLoader.showErrorDialog(description: e.message);
      log("catch : $e.response.data");
    }
  }

  Future<String> uploadImage(String imagePath) async {
    CommonLoader.showLoading();
    try {
      var data =
          FormData.fromMap({"files": await MultipartFile.fromFile(imagePath)});
      Response r = await client.post("/api/common/files", data: data);
      CommonLoader.hideLoading();
      if (r.statusCode == 200) {
        log("resU $r");
        CommonLoader.showSuccessDialog(description: r.data["msg"]);
        return r.data["data"]["image"];
      } else {
        CommonLoader.showErrorDialog(description: r.data["error"]);
        log("futu else $r");
        return Future.error(r.data['error']);
      }
    } on DioError catch (e) {
      CommonLoader.hideLoading();
      log("DioError $e");
      CommonLoader.showErrorDialog(description: e.message);
      return Future.error(e.message);
    }
  }

  Future<ProfileModel> getProfileApi() async {
    log("future ${Client.profileId}");
    try {
      Response r = await client.get(Client.profileId);
      log("api call ${Client.profileId}");
      if (r.statusCode == 200) {
        // log("success 200 profile $r");
        return profileModelFromJson(jsonEncode(r.data["data"]));
      } else {
        log("error $r");
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      log("dio err $e");
      return Future.error(e.message);
    }
  }
}
