import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.black,)),
          elevation: 0,
          backgroundColor: Constants.themeColor,
          centerTitle: true,
          title: Text(
            'Notifications',
            style: TextStyle(
                fontFamily: 'bold',
                fontSize: Constants.width * 0.04,
                color: Colors.black
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.03),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.04, vertical: Constants.height * 0.02),
                margin: EdgeInsets.only(bottom: Constants.height * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffEAEAEB))
                ),
                child: Row(
                  children: [
                    Container(
                      height: Constants.height * 0.06,
                      // padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Constants.themeColor
                      ),
                      child: Image.asset('assets/profile/info.png', scale: 1.7,),
                    ),
                    SizedBox(width: Constants.width * 0.04,),
                    Container(
                      width: Constants.width * 0.65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your driver has arrived',
                            style: TextStyle(
                              fontFamily: 'semiBold'
                            ),
                          ),
                          SizedBox(height: Constants.height * 0.01,),
                          Text(
                            'Driver has arrived for schedule ride.',
                            style: TextStyle(
                              fontFamily: 'regular',
                              color: Color(0xff7A7A7B)
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
