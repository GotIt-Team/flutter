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

  static Widget dialog({@required BuildContext context, @required Widget title, Widget content, DialogButtons dialogButton = DialogButtons.ok, void Function(DialogResult) onPress, bool isPopup=false}) {
    return Card(
      margin: EdgeInsets.only(
        left: 15,
        right: 15
      ),
      elevation: 10,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            
          ),
          child: Column(
            children: [
              AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5)
                  )
                ),
                automaticallyImplyLeading: false,
                title: title,
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
              Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  bottom: 24,
                  left: 20,
                  right: 20
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: content
                  ),
                ),
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: _buttons(context, dialogButton, isPopup, onPress),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Future<DialogResult> show({@required BuildContext context, @required Widget title, Widget content, DialogButtons dialogButton = DialogButtons.ok}) async{
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
        return dialog(
          context: buildContext, 
          title: title, 
          content: content, 
          dialogButton: dialogButton, 
          isPopup: true
        );
      }
    );
  }
}