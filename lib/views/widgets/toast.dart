import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Toast {
  VoidCallback onpressed;
  GlobalKey<ScaffoldState> scaffoldKeyey;
  static void showToast(
      {BuildContext context, IconData icon, String title, String message}) {
    Flushbar(
      aroundPadding: EdgeInsets.all(10),
      borderRadius: 8,
      backgroundGradient: LinearGradient(
        colors: [Colors.green.shade800, Colors.greenAccent.shade700],
        stops: [0.6, 1],
      ),
      icon: Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
     
      boxShadows: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(3, 3),
          blurRadius: 3,
        ),
      ],
      // All of the previous Flushbars could be dismissed by swiping down
      // now we want to swipe to the sides
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      // The default curve is Curves.easeOut
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      title: title,
      message: message,
      duration: Duration(seconds:3),
    )..show(context);
  }
}
