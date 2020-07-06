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

  static Widget dialog({EdgeInsetsGeometry padding, @required BuildContext context, @required Widget title, Widget content, DialogButtons dialogButton = DialogButtons.ok, void Function(DialogResult) onPress, bool isPopup=false, Widget titleTrailing}) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(
          left: 15,
          right: 15
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Semantics(
              child: AppBar(
                automaticallyImplyLeading: false,
                title: title,
                actions: titleTrailing != null ? [Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: titleTrailing,
                )] : [],
              ),
              namesRoute: true,
              container: true,
            ),
            Flexible(
              child: Padding(
                padding: padding ?? EdgeInsets.all(10),
                child: SingleChildScrollView(child: content),
              ),
            ),
            ButtonBar(
              children: _buttons(context, dialogButton, isPopup, onPress),
            ),
          ],
        ),
      ),
    );
  }

  static Future<DialogResult> show({@required BuildContext context, @required Widget title, Widget content, DialogButtons dialogButton = DialogButtons.ok}) async{
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext buildContext) {
        return WillPopScope(
          onWillPop: () async => false,
          child: dialog(
            context: buildContext, 
            title: title, 
            content: content, 
            dialogButton: dialogButton, 
            isPopup: true,
            titleTrailing: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context, DialogResult.close);
              },
            )
          ),
        );
      }
    );
  }
}