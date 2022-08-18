import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';

class AlertDialogOnLogout extends StatefulWidget {
  const AlertDialogOnLogout({Key? key}) : super(key: key);

  @override
  State<AlertDialogOnLogout> createState() => _AlertDialogOnLogoutState();
}

class _AlertDialogOnLogoutState extends State<AlertDialogOnLogout> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure want to Logout?', style: TextStyle(fontFamily: 'bold'), textAlign: TextAlign.center,),
      content: SizedBox(height: Constants.height * 0.005,),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: <Widget>[
        GestureDetector(
          onTap: (){
          },
          child: Container(
            width: Constants.width * 0.32,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: EdgeInsets.only(bottom: Constants.height * 0.01),
            decoration: BoxDecoration(
              color: Constants.themeColor,
              borderRadius: BorderRadius.circular(8),),
            child: Center(
              child: Text(
                'YES',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'bold',
                    fontSize: Constants.width * 0.035
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
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
                    fontSize: Constants.width * 0.035
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
