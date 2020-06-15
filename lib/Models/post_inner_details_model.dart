


import 'package:gotit/Models/user_model.dart';

import 'comment_model.dart';

class PostInnerDetailsModel{
  User user;
  List<String> images;
  List<Comment> comments;
  PostInnerDetailsModel({this.user,this.images,this.comments});

   
}