import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog {
  static Future show({BuildContext context, Future<void> Function() method, bool isCircular=true}) {
    method().then((value) {
      Navigator.pop(context);
    });
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          content: SingleChildScrollView(
            child: Center(
              child: ListTile(
                title: Center(child: Text('Please Wait ...')),
                subtitle: !isCircular ? LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                  backgroundColor: null,
                ) : null,
                leading: isCircular ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)
                ) : null
              ),
            ),
          ),
        );
      }
    );
  }

}