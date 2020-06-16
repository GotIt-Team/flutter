import '../Models/user_model.dart';
import 'package:flutter/material.dart';
class RegisterPresinter {
  final ViewModel userModel = new ViewModel();

  void RName(String name) {
    userModel.Name = name;
  }

  void REmail(String email) {
    userModel.Email = email;
  }

  void RPassword1(String pass1) {
    userModel.Password1 = pass1;
  }

  void RPassword2(String pass2) {
    userModel.Password2 = pass2;
  }

  void RPhoneNumber(String number) {
    userModel.PhoneNumber = number;
  }

  void RAddress(String address) {
    userModel.Address = address;
  }

  void RGender(String gender) {
    userModel.Gender = gender;
  }

  //Valdiation Functions of form

  String validateName(String name) {
    if (name.isEmpty) {
      return "Please Enter Your Name";
    }
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return "Please Enter Your Correct Email";
    }
  }

  String validatePassword1(String pass1) {
    if (pass1.isEmpty || pass1.length < 8) {
      return "Please Enter at least 8 characters";
    }
  }

  String validatePassword2(String pass2) {
    if (pass2.isEmpty) {
      return "The password not Identical!";
    }
  }

  String validatePhone(String number) {
    if (number.isEmpty || number.length < 11) {
      return "Please Enter Correct phone number ! ";
    }
  }

  String validateAddress(String address) {
    if (address.isEmpty) {
      return "Please Enter Your Address";
    }
  }

  String validateGender(String gender){
    if(gender.isEmpty){
      return "Please Enter male Or female";
    }
  }



  void x() {
    print(userModel.Name);
    print(userModel.Email);
    print(userModel.Password1);
    print(userModel.Password2);
    print(userModel.Gender);
    print(userModel.PhoneNumber);
    print(userModel.Address);
  }

  void cancelForm() {
    userModel.Name = null;
    userModel.Email = null;
    userModel.Password1 = null;
    userModel.Password2 = null;
    userModel.PhoneNumber = null;
    userModel.Address = null;
    userModel.Gender = null;
    x();
    print('Cancel Done!');
  }
}