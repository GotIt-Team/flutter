import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/enums/result_message_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/registration_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/dropdown_element.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';

class RegistrationPage extends StatelessWidget {
  final RegisterationPresenter _registrationPresenter = RegisterationPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void _singup(BuildContext context, DialogResult result){
    if(result == DialogResult.ok) {
      if(formkey.currentState.validate()) {
        formkey.currentState.save();
        _registrationPresenter.registration(context).then((value) {
          var flag = !_registrationPresenter.result.isSucceeded || !_registrationPresenter.result.data;
          var resultMessage = Helpers.getEnumFromString(ResultMessage.values, _registrationPresenter.result.message);
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
          ).then((value) {
            if(!flag || !(resultMessage == ResultMessage.emailExists)) {
              Navigator.pop(context);
            }
          });
        });
      }
    } else { 
      Navigator.pop(context);
    }
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/landing.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("assets/images/app_bar_logo.png"),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: DialogBox.dialog(
                  context: context,
                  title: Text('Registration'),
                  content: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                            onSaved: _registrationPresenter.setName,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              icon: Icon(Icons.email),
                              labelText: 'Email',
                              hintText: 'example@email.com',
                            ),
                            validator: Validator.emailField,
                            onSaved: _registrationPresenter.setEmail,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Password',
                              hintText: 'Enter your password',
                            ),
                            validator: Validator.passwordField,
                            onSaved: _registrationPresenter.setPassword,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key),
                              labelText: 'Confirm Password',
                              hintText: 'Enter password again',
                            ),
                            validator: Validator.rePasswordField,
                            onSaved: _registrationPresenter.setRepeatePassword,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              icon: Icon(Icons.phone),
                              labelText: 'Phone number',
                              hintText: 'Enter your phone number',
                            ),
                            validator: Validator.phoneField,
                            onSaved: _registrationPresenter.setPhoneNumber,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: DropdownElement(
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Gender',
                              hintText: 'Select your gender',
                            ),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            onSaved: (value){
                              _registrationPresenter.setGender(value);
                            },
                            onChanged: (value){
                              _registrationPresenter.gender = value;
                            },
                            items: Helpers.getListOfStringsFromEnum(Gender.values)
                          ) ,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: 'Address',
                              hintText: 'Enter your address',
                            ),
                            onSaved: _registrationPresenter.setAddress
                          ) ,
                        )
                      ],
                    ),
                  ),
                  dialogButton: DialogButtons.ok_cancel,
                  onPress: (DialogResult result) => _singup(context, result)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
