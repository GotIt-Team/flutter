import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/presenters/user_setting_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/enums/result_message_enum.dart';


class UserGeneralSettings extends StatelessWidget {
  final UserSettingsPresenter _generalSetting = UserSettingsPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _updateGeneralData(BuildContext context, DialogResult result){
    if(result == DialogResult.update) {
      if(formkey.currentState.validate()) {
        formkey.currentState.save();
        _generalSetting.updateData(context).then((value) {
          var flag = !_generalSetting.result.isSucceeded || !_generalSetting.result.data;
          var resultMessage = Helpers.getEnumFromString(ResultMessage.values, _generalSetting.result.message);
          DialogBox.show(
              context: context,
              title: Text(flag ? 'Error' : 'Done'),
              content: Text(
                StateMessage.get(resultMessage),
                style: TextStyle(
                    fontSize: 20
                ),
                textAlign: TextAlign.center
              ),
              dialogButton: DialogButtons.ok
          );
        });
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return DialogBox.dialog(
        context: context,
        title: Text('GENERAL'),
        content: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => print('picture clicked'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40) ,
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/Sheka.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Name',
                    hintText: 'Enter your name',
                  ),
                  validator: Validator.notMore32RequiredField,
                  onSaved: _generalSetting.setName,
                  initialValue: _generalSetting.user.name,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: 'Phone number',
                    hintText: 'Enter your phone number'
                  ),
                  validator: Validator.phoneField,
                  onSaved: _generalSetting.setPhoneNumber,
                  initialValue: _generalSetting.user.phoneNumber,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      icon: Icon(Icons.location_on),
                      labelText: 'Address',
                      hintText: 'Enter your address'
                  ),
                  validator: Validator.notMore32RequiredField,
                  onSaved:_generalSetting.setAddress,
                  initialValue: _generalSetting.user.address,
                ),
              )
            ],
          ),
        ),
        dialogButton: DialogButtons.update,
        onPress: (DialogResult result) => _updateGeneralData(context, result)
    );
  }
}