import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class UserSecuritySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogBox.dialog(
      context: context,
      title: Text('SECURITY'),
      content: Form(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'Old password',
                  hintText: 'Enter your password',
                ),
                validator: Validator.requiredField,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'New password',
                  hintText: 'Enter your new password'
                ),
                validator: Validator.passwordField,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'Repeate new password',
                  hintText: 'Repeate your new password'
                ),
                validator: Validator.rePasswordField,
              ),
            )
          ],
        ),
      ),
      dialogButton: DialogButtons.update_cancle,
      onPress: (result) {
        if (result == DialogResult.update){
          print('Update');
        } else {
          print('cancle');
        }
      }
    );
  }

}