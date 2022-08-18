import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';

class ReusablePassengerCard extends StatelessWidget {
  const ReusablePassengerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Constants.width * 0.035),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile/profilePhoto.png'),
            radius: 20,
          ),
          SizedBox(width: Constants.width * 0.04,),
          Container(
            child: Text(
              'Dhruv Rathee',
              style: TextStyle(
                  color: Color(0xff565657),
                  fontSize: Constants.width * 0.04
              ),
            ),
            width: Constants.width * 0.5,
          ),
          // Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: Constants.width * 0.02, vertical: 5),
            decoration: BoxDecoration(
              color: Constants.themeColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  'Picked up',
                  style: TextStyle(
                      fontFamily: 'semiBold',
                      fontSize: Constants.width * 0.03,
                      color: Color(0xff282829)
                  ),
                ),
                SizedBox(width: Constants.width * 0.015,),
                Image.asset('assets/trips/tickMark.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
