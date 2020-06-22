import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/dialog_buttons_enum.dart';
import 'package:gotit/enums/dialog_result_enum.dart';
import 'package:gotit/presenters/login_presenter.dart';
import 'package:gotit/views/widgets/alert_dialog.dart';
import 'package:gotit/helpers.dart';

class LoginPage extends StatelessWidget{
  final LoginPresenter loginPresenter = LoginPresenter();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double valuePadding = MediaQuery.of(context).size.height * 0.01 ;
    return Scaffold(
      body: DialogBox.dialog(
        context: context, 
        title: Text('Login'),
        content: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(valuePadding),child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: ('Enter Your Email'),
                ),
                validator: loginPresenter.validateEmail,
                onSaved: loginPresenter.setEmail,
              ),
            ),
            Padding(padding: EdgeInsets.all(valuePadding),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: ('Enter Your Password'),
                ),
                validator:loginPresenter.validatePassword,
                onSaved:loginPresenter.setPassword,
              ),
            ),
          ],
        ),
        ),
        dialogButton: DialogButtons.ok_cancel,
        onPress: (DialogResult result){
          String buttonStringResult = Helpers.getStringFromEnum(result);
          print(buttonStringResult);
          if(buttonStringResult == 'ok')
          {  loginPresenter.login();}
          else{ Navigator.pop(context);}
        }
        
      ),

    );
  }
}