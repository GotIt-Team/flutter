import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/helpers.dart';

class DialogBox {

  static List<Widget> _buttons(BuildContext context, DialogButtons dialogButton, bool isPopup, void Function(DialogResult) onPress){
    List<Widget> result = [];
    var enumChose = Helpers.getStringFromEnum(dialogButton);
    var buttons = enumChose.split('_');

    for(var button in buttons){
      result.add(FlatButton(
        child: Text(button.toUpperCase()),
        onPressed: () {
          var clickedButton = Helpers.getEnumFromString(DialogResult.values, button);
          if(isPopup){
            Navigator.pop(context, clickedButton);
          }
          else{
            onPress(clickedButton);
          }
        }
      ));
    }
    return result;
  }

  static Widget dialog({@required BuildContext context, @required String title, Widget content, DialogButtons dialogButton = DialogButtons.ok, void Function(DialogResult) onPress, bool isPopup=false}) {
    return Container(
      child: AlertDialog(
        // redius shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        // remove default padding
        titlePadding: EdgeInsets.all(0),
        // add AppBar to show title
        title: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          automaticallyImplyLeading: false,
          title: Text(title),
          actions: isPopup ? [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context, DialogResult.close);
              },
            )
          ] : []
        ),
        // Dialog Content 
        content: SingleChildScrollView(
          child: Center(
            child: content
          ),
        ),
        actions: _buttons(context, dialogButton, isPopup, onPress)
      ),
    );
  }

  static Future<DialogResult> show({@required BuildContext context, @required String title, Widget content, DialogButtons dialogButton = DialogButtons.ok}) async{
    return showDialog<DialogResult>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return dialog(
          context: context, 
          title: title,
          content: content,
          dialogButton: dialogButton,
          isPopup: true
        );
      },
    );
  }
}