import 'dart:developer';

import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/view/screens/authentication/login.dart';
import 'package:biotrips/view/screens/dashboard/dashboard.dart';
import 'package:biotrips/view/screens/onboarding/onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../helpers/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 3), () async {
      checkLogin();
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/OnBoarding1', (route) => false);
    });
    super.initState();
    // func();
  }

  checkLogin() async {
    GetStorage box = GetStorage();
    try {
      String? token = box.read("token");
      String? profileUrl = box.read("profileUrl");
      if (token != null && profileUrl != null ) {
        Client.token = token;
        Client.profileUrl = profileUrl;
        Get.off(() => Dashboard());
        log("check login $profileUrl");
      }
      //  else if (profileUrl != null) {
      //   Client.profileUrl = profileUrl;
      //   Get.off(() => Dashboard());
      //   log("check login $profileUrl");
      // }
       else {
        Navigator.pushNamedAndRemoveUntil(
            context, '/OnBoarding1', (route) => false);
        //  Get.off(() =>   OnBoarding1());
      }
    } on Exception {
      Get.off(() => const Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = Constants.height;
    double width = Constants.width;
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.3,
          ),
          Image.asset(
            'assets/onboarding/biotripsText.png',
            fit: BoxFit.fill,
            width: width * 0.7,
          ),
          SizedBox(
            height: height * 0.05,
          ),
          const Center(
            child: CircularProgressIndicator(
              color: Color(0xffFDD015),
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/onboarding/splashScreenAsset.png',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
