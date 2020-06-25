import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/enums/result_message_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/login_presenter.dart';
import 'package:gotit/services/state_message_service.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';

class LoginPage extends StatelessWidget{
  final LoginPresenter loginPresenter = LoginPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  _login(BuildContext context, DialogResult result) {
    if(result == DialogResult.ok){
      if(formkey.currentState.validate()){
        formkey.currentState.save();
        loginPresenter.login(context).then((value) {
          if(!loginPresenter.result.isSucceeded){
            var resultMessage = Helpers.getEnumFromString(ResultMessage.values, loginPresenter.result.message);
            DialogBox.show(
              context: context, 
              title: Text('Error'),
              content: Text(
                StateMessage.get(resultMessage),
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              dialogButton: DialogButtons.ok
            );
          } else {
            Navigator.pushNamed(context, "/home");
          }
        });
      }
    } else {
      formkey.currentState.reset();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Image.asset("assets/images/app_bar_logo.png"),
              ),
              DialogBox.dialog(
                context: context, 
                title: Text('Login'),
                content: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
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
                          onSaved: loginPresenter.setEmail,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            labelText: 'Password',
                            hintText: 'Enter your password'
                          ),
                          validator: Validator.requiredField,
                          onSaved: loginPresenter.setPassword,
                        ),
                      )
                    ]
                  ),
                ),
                dialogButton: DialogButtons.ok_cancel,
                onPress: (DialogResult result) => _login(context, result)
              )
            ]
          )
        )
      )
    );
  }
}