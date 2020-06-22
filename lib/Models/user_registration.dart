import 'package:flutter/cupertino.dart';
import 'package:gotit/enums/gender_enum.dart';
import 'package:gotit/enums/user_type_enum.dart';

class UserRegistration {
  int id;
  String name;
  String email;
  String password;
  String repeatPassword;
  String phoneNumber;
  String country;
  String city;
  String picture;
  UserType type;
  Gender gender;

  Map<String, dynamic> toJson(){
   return
     {
       'name': name,
       'email': email,
       'password': password,
       'repeatPassword': repeatPassword,
       'phoneNumber':phoneNumber,
       'city': city,
       'country': country,
       'gender': gender,
     };
 }

 //  for testing

}