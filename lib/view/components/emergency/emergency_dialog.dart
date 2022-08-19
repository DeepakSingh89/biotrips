import 'package:biotrips/helpers/constants.dart';
import 'package:flutter/material.dart';

class EmergencyDialog extends StatefulWidget {
  const EmergencyDialog({Key? key}) : super(key: key);

  @override
  State<EmergencyDialog> createState() => _EmergencyDialogState();
}

class _EmergencyDialogState extends State<EmergencyDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        '''Send Alert to Admin
that you're in Trouble?''',
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
            _showPopup();
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
    );
  }

  _showPopup() {
    return AlertDialog(
      title: Column(
        children: [
         const Text(
        "Alert Sent to Admin",
        style: TextStyle(fontFamily: 'bold'),
        textAlign: TextAlign.center,
      ),
       const Text(
        "Don't worry you will be recieving help soon.",
        style: TextStyle(fontFamily: 'normal'),
        textAlign: TextAlign.center,
      ),
     SizedBox(
        height: Constants.height * 0.005,
      ),
      GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: Constants.width,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            margin: EdgeInsets.only(bottom: Constants.height * 0.01),
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
      )
    );
  }
}
