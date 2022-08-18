import 'package:flutter/material.dart';

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
      Navigator.pushNamedAndRemoveUntil(
          context, '/OnBoarding1', (route) => false);
    });
    super.initState();
    // func();
  }

  @override
  Widget build(BuildContext context) {
    double height = Constants.height;
    double width = Constants.width;
    return Material(
      child: Column(
        children: [
          SizedBox(height: height * 0.3,),
          Image.asset('assets/onboarding/biotripsText.png', fit: BoxFit.fill, width: width * 0.7,),
          SizedBox(height: height * 0.05,),
          Center(child: CircularProgressIndicator(color: Color(0xffFDD015),),),
          Spacer(),
          Image.asset('assets/onboarding/splashScreenAsset.png', fit: BoxFit.fill,),
        ],
      ),
    );
  }
}
