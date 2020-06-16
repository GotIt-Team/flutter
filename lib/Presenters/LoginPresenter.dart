import 'package:flutter/cupertino.dart';
import 'package:gotit/Models/user_model.dart';
class LoggerPresenter {
  ViewModel usermodel = new ViewModel();
  // setter
  void UserName(String Email){
    usermodel.Email=Email;
  }
  void Password(String password){
    usermodel.Password1=password;
  }
  String validateName(String Email){
    if(Email.isEmpty){
      return "Please Enter Your Email";
    }
  }
  String validatePassword(String password){
    if(password.isEmpty){
      return "Please Enter Your password";
    }
  }
  void p(){print(usermodel.Email);print(usermodel.Password1);}



}