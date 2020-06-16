
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/Presenters/LoginPresenter.dart';
import 'package:gotit/Services/user_information.dart';

class LoginPage extends StatefulWidget{
  LoggerPresenter LP =new LoggerPresenter();

  State <StatefulWidget>createState()=>LoginState();
}

class LoginState extends State<LoginPage>{
  @override
  final GlobalKey <FormState> formkey = new GlobalKey<FormState>();
  String value;
  var Resulte=SendUserDataLogin();
  void login(){
    if(formkey.currentState.validate()){
       formkey.currentState.save();
       if ( Resulte=='True' ){Navigator.pop(context,'home_tab');}
       else{ print('login error');}
      //Post Request
    }
    else {
      print('form error');
    }
  }

  Widget build(BuildContext context) {
    double valuePadding = MediaQuery.of(context).size.height * 0.01 ;
    return Scaffold(
      appBar: AppBar(
        title:Text('Login')
      ),
     body: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(padding: EdgeInsets.all(valuePadding),child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'UserName',
                    hintText: ('Enter Your Email'),
                  ),
                  validator:widget.LP.validateName,
                  onSaved:widget.LP.UserName,

                ),),
                Padding(padding: EdgeInsets.all(valuePadding),child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Password',
                    hintText: ('Enter Your Password'),

                  ),
                  validator:widget.LP.validatePassword,
                  onSaved:widget.LP.Password,

                ),),
                FlatButton(
                  child: Text('Login'),
                  //color: Colors.blueAccent,
                  onPressed:login,
                ),
              ],
            ),
          ),

    );
  }
}