import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class UserGeneralSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogBox.dialog(
      context: context,
      title: Text('GENERAL'),
      content: Form(
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
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: DropdownElement(
                decoration: InputDecoration(
                  icon: Icon(Icons.palette),
                  labelText: 'Theme',
                  hintText: 'Choose Theme mode'
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                items: ['Light', 'Dark'].map<DropdownMenuItem<String>>((theme) {
                  var val = Helpers.getStringFromEnum(theme);
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: DropdownElement(
                decoration: InputDecoration(
                  icon: Icon(Icons.language),
                  labelText: 'Language',
                  hintText: 'Choose language'
                ),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                items: ['Arabic', 'English'].map<DropdownMenuItem<String>>((lang) {
                  var val = Helpers.getStringFromEnum(lang);
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
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