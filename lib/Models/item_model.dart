
import 'package:flutter/cupertino.dart';
import 'package:gotit/Models/user_model1.dart';

class Item{
  User user;
  String content;
  String creationData;
  String image;
  int id;
  
  Item({@required this.id,this.user,this.content,this.creationData,this.image,});

}