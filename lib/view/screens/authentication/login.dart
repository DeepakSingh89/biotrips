import 'dart:developer';

import 'package:biotrips/endpoint/provider/user_repo.dart';
import 'package:biotrips/endpoint/server/api_client.dart';
import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final controller = TextEditingController(text: '');
  bool showErrorMessage = false;
  @override
  Widget build(BuildContext context) { 
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Constants.height,
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Constants.height * 0.07,
                ),
                Image.asset(
                  'assets/authentication/login.png',
                  fit: BoxFit.fill,
                  height: Constants.height * 0.3,
                ),
                SizedBox(
                  height: Constants.height * 0.04,
                ),
                Text(
                  'Sign in to see your Trips',
                  style: TextStyle(
                      fontFamily: 'bold', fontSize: Constants.width * 0.065),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Constants.height * 0.03,
                ),
                Text(
                  'Enter your phone number, we will verify this with OTP.',
                  style: TextStyle(
                      fontFamily: 'regular', fontSize: Constants.width * 0.04),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Constants.height * 0.05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/authentication/indianFlag.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child:TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        // maxLength: 10,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Mobile Number',
                          prefixText: '+91  ',
                          // prefixStyle: TextStyle(fontWeight: FontWeight.bold)
                        ),
                        //   );
                        // }),
                      )),
                    ],
                  ),
                ),
                // Spacer(),
                if (showErrorMessage == true) ...[
                  SizedBox(
                    height: Constants.height * 0.01,
                  ),
                  const Text(
                    'Please enter a valid number',
                    style: TextStyle(color: Colors.red),
                  )
                ],
                SizedBox(
                  height: Constants.height * 0.1,
                ),
                // Material(
                //   borderRadius: BorderRadius.circular(80),
                //   elevation: 5,
                //   child: CircleAvatar(
                //     radius: Constants.height * 0.035,
                //     backgroundColor: Constants.themeColor,
                //     child:
                //   ),
                // ),
                SizedBox(
                  height: Constants.height * 0.03,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
              right: Constants.width * 0.02, bottom: Constants.height * 0.03),
          child: FloatingActionButton(
            onPressed: () => login(),
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

  bool isMobileNumberValid() {
    String mobileNumber = controller.text.toString();
    log("mobileNumber $mobileNumber");
    String regexPattern = r'^(?:[+0][1-9])?[0-9]{10}$';
    var regExp = RegExp(regexPattern);
    if (mobileNumber.length == 0 || regExp.hasMatch(mobileNumber) == false) {
      setState(() {
        showErrorMessage = true;
        log("setSta $showErrorMessage");
      });
      log("ret false");
      return false;
    }
    log("ret true");
    return true;
  }

  login() {
    try {
      log("try ${controller.text}");
      if (isMobileNumberValid() == true) {
        Client client = Client();
        UserEndPointRepsitory repsitory =
            UserEndPointRepsitory(client: client.init());
        log("message");
        repsitory.loginApi(phoneNo: controller.text.toString());
        // Navigator.pushNamed(context, '/VerifyOtp');
        log("cicked $controller");
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
