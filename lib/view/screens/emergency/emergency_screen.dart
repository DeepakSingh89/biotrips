import 'dart:developer';

import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Constants.themeColor,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/TripStatus');
                  },
                  icon: Image.asset('assets/icons/close.png',
                      fit: BoxFit.fill, height: Constants.height * 0.04)),
              title: Text(
                "Emergency",
                style: TextStyle(
                    fontFamily: 'bold',
                    fontSize: Constants.width * 0.04,
                    color: Colors.black),
              ),
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.05),
              children: [
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Text(
                  "In an Emergency?",
                  style: TextStyle(
                      fontFamily: 'bold', fontSize: Constants.width * 0.05),
                ),
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                InkWell(
                  onTap: () => callPolice("100"),
                  child: Container(
                    width: Constants.width,
                    padding: EdgeInsets.symmetric(
                        horizontal: Constants.width * 0.12,
                        vertical: Constants.height * 0.015),
                    decoration: BoxDecoration(
                        color: Color(0xffFF0000),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Call Police (100)',
                        style: TextStyle(
                            fontFamily: 'semiBold',
                            color: Colors.white,
                            fontSize: Constants.width * 0.045),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Container(
                  width: Constants.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.width * 0.12,
                      vertical: Constants.height * 0.015),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Send Alert to Admin',
                      style: TextStyle(
                          fontFamily: 'normal',
                          fontSize: Constants.width * 0.045),
                    ),
                  ),
                ),
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Share your Ride details",
                      style: TextStyle(
                          fontFamily: 'semiBold',
                          fontSize: Constants.width * 0.04),
                    ),
                    GestureDetector(
                        onTap: () async {
                          await openDialog();
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                            'assets/profile/rightArrow.png',
                            height: Constants.height * 0.02,
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: Constants.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Learn More About Safety",
                      style: TextStyle(
                          fontFamily: 'semiBold',
                          fontSize: Constants.width * 0.04),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/SafetyGuidelines');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image.asset(
                            'assets/profile/rightArrow.png',
                            height: Constants.height * 0.02,
                          ),
                        ))
                  ],
                )
              ],
            )));
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => AlertDialog(
              title: const Text(
                '''Send Alert to Admin that you're in Trouble?''',
                style: TextStyle(fontFamily: 'bold'),
                textAlign: TextAlign.center,
              ),
              content: SizedBox(
                height: Constants.height * 0.005,
              ),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showPopup();
                    });
                  },
                  child: Container(
                    width: Constants.width * 0.32,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    margin: EdgeInsets.only(bottom: Constants.height * 0.01),
                    decoration: BoxDecoration(
                      color: Constants.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'YES',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.035),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    margin: EdgeInsets.only(bottom: Constants.height * 0.01),
                    width: Constants.width * 0.32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black)),
                    child: Center(
                      child: Text(
                        'NO',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'bold',
                            fontSize: Constants.width * 0.035),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Future showPopup() {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) => AlertDialog(
                      title: Column(
                    children: [
                      const Text(
                        "Alert Sent to Admin",
                        style: TextStyle(fontFamily: 'bold'),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "Don't worry you will be recieving help soon.",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: Constants.height * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/EmergencyScreen', (route) => false);
                        },
                        child: Container(
                          width: Constants.width,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          margin:
                              EdgeInsets.only(bottom: Constants.height * 0.01),
                          decoration: BoxDecoration(
                            color: Constants.themeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Okay',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'bold',
                                  fontSize: Constants.width * 0.035),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )));
        });
  }

 Future<void> callPolice(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
