import 'package:flutter/material.dart';

class Utils{
  static Widget googleMapWidget = Center(child: CircularProgressIndicator(),);

  static void showAlertDialog(BuildContext context, Widget widget, bool barrierDismissible) async {
    showDialog(barrierDismissible: barrierDismissible, context: context, builder: (BuildContext context) => widget);
  }
}