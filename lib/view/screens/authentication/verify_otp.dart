import 'dart:developer';

import 'package:biotrips/endpoint/provider/user_repo.dart';
import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  Map<int, String> otpMap = {};
  String otp = "";
  setOTP() {
    otp = "";
    for (var element in otpList) {
      otp = otp + element.text;
    }
  }

  List<TextEditingController> otpList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  verifyOtp() {
    try {
      setOTP();
      log("otp $otp");
      Client client = Client();
      UserEndPointRepsitory repsitory =
          UserEndPointRepsitory(client: client.init());
      repsitory.verifyOtp(otp);
    } catch (error) {
      log(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          height: Constants.height,
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Constants.height * 0.01,
                ),
                Image.asset(
                  'assets/authentication/verifyOtp.png',
                  fit: BoxFit.fill,
                  height: Constants.height * 0.3,
                ),
                SizedBox(
                  height: Constants.height * 0.04,
                ),
                Text(
                  'Verify your Phone Number',
                  style: TextStyle(
                      fontFamily: 'bold', fontSize: Constants.width * 0.065),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Text(
                  'Enter your OTP here.',
                  style: TextStyle(
                      fontFamily: 'regular', fontSize: Constants.width * 0.04),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Constants.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 4; i++)
                      OtpInput(
                          controller: otpList[i],
                          autoFocus: i == 0 ? true : false),

                    // _textFieldOTP(true, false, 0),
                    // _textFieldOTP(false, false, 1),
                    // _textFieldOTP(false, false, 2),
                    // _textFieldOTP(false, false, 3),
                  ],
                ),
                SizedBox(
                  height: Constants.height * 0.03,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'RESEND',
                    style: TextStyle(
                        fontFamily: 'bold',
                        color: Colors.black,
                        fontSize: Constants.width * 0.04),
                  ),
                ),
                SizedBox(
                  height: Constants.height * 0.1,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              right: Constants.width * 0.02, bottom: Constants.height * 0.03),
          child: FloatingActionButton(
            onPressed: () {
              verifyOtp();
              // Navigator.pushNamedAndRemoveUntil(
              //     context, '/Dashboard', (route) => false);
            },
            backgroundColor: Constants.themeColor,
            child: Image.asset(
              'assets/icons/arrowRight.png',
              width: Constants.width * 0.05,
            ),
          ),
        ),
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  // (bool first, bool last, int index)
  const OtpInput({
    Key? key,
    required this.controller,
    required this.autoFocus,
  }) : super(key: key);
  final bool autoFocus;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.height * 0.09,
      width: Constants.width * 0.15,
      child: Center(
        child: TextField(
          autofocus: true,
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            // otpMap[index] = value;
            // if (value.length == 1 && last == false) {
            //   FocusScope.of(context).nextFocus();
            // }
            // if   (value.length == 0 && first == false) {
            //   otpMap.remove(index);
            //   FocusScope.of(context).previousFocus();
            // }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          enableSuggestions: false,
          // decoration: InputDecoration(
          //   counterText: "",
          // ),
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
