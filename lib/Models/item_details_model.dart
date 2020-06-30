
import 'package:gotit/enums/item_type.dart';

import 'package:gotit/models/user_model.dart';
import 'package:gotit/models/comment_model.dart';

class ItemDetails{
  int id;
  DateTime creationDate;
  String content;
  bool isLost;
  ItemType type;
  List<String> images;
  List<List<int>>boxes;
  Map<int,String> attributes;
  
  List<Comment> comments;
  User user;

  ItemDetails({this.id, this.creationDate, this.content, this.isLost, this.type, 
    this.images, this.comments, this.user,this.attributes,this.boxes});
  
  ItemDetails.fromJson(dynamic data){
    id = data['id'];
    creationDate = data['creationDate'];
    content = data['content'];
    isLost = data['isLost'];
    type = ItemType.values[data['type'] - 1];
    images = data['images'];
    attributes = data['attributes'];
    comments = List<Comment>.generate(data['comments'].length, (index) => Comment.fromJson(data['comments'][index]));
    user = User.fromJson(data['user']);
  } 
  
}