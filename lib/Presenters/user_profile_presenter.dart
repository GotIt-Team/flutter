//user profile presenter class

import 'package:flutter/cupertino.dart';
import '../Models/user_model.dart';
import '../Services/user_services.dart';

class HomePresenter{
  final UserModel _userModel = UserModel();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final UserService _userService = Habd();
  
  GlobalKey get key{
    return _key;
  }

  void submit(){
    if(_key.currentState.validate()){
      _key.currentState.save();
      //_userService.fetchData();
      print('');
    }
  }

  List<String> fetch(){
    List<String> x = [];
    for(int i = 0; i < 10; i++){
      x.add("hello" + i.toString());
    }
    return x;
  }

  String validateName(String name){
    if(name.isEmpty){
      return "Please Enter Your Name";
    }
  }

  String validateAge(String age){
    if(age.isEmpty){
      return "Please Enter Your Age";
    }
  }

  void name(String name){
    _userModel.name = name;
  }

  void age(String age){
    _userModel.age = int.parse(age);
  }

  UserModel get userModel{
    return this._userModel;
  }
}