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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_outlined, color: Colors.black,)),
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
                SizedBox(height: Constants.height * 0.01,),
                Image.asset('assets/authentication/verifyOtp.png', fit: BoxFit.fill, height: Constants.height * 0.3,),
                SizedBox(height: Constants.height * 0.04,),
                Text(
                  'Verify your Phone Number',
                  style: TextStyle(
                      fontFamily: 'bold',
                      fontSize: Constants.width * 0.065
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Constants.height * 0.02,),
                Text(
                  'Enter your OTP here.',
                  style: TextStyle(
                      fontFamily: 'regular',
                      fontSize: Constants.width * 0.04
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Constants.height * 0.07,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _textFieldOTP(true, false, 0),
                    _textFieldOTP(false, false, 1),
                    _textFieldOTP(false, false, 2),
                    _textFieldOTP(false, false, 3),
                  ],
                ),
                SizedBox(height: Constants.height * 0.05,),
                Text(
                  'RESEND',
                  style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: Constants.width * 0.04
                  ),
                ),
                SizedBox(height: Constants.height * 0.1,),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: Constants.width * 0.02, bottom: Constants.height * 0.03),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/Dashboard', (route) => false);
            },
            backgroundColor: Constants.themeColor,
            child: Image.asset('assets/icons/arrowRight.png', width: Constants.width * 0.05,),
          ),
        ),
      ),
    );
  }

  Widget _textFieldOTP(bool first, bool last, int index) {
    return Container(
      height: Constants.height * 0.09,
      width: Constants.width * 0.15,
      child: Center(
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            otpMap[index] = value;
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              otpMap.remove(index);
              FocusScope.of(context).previousFocus();
            }
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
