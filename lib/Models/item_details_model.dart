
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/models/object_model.dart';
import 'package:gotit/models/person_model.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/models/comment_model.dart';

class ItemDetails{
  int id;
  DateTime creationDate;
  String content;
  bool isLost;
  ItemType type;
  List<String> images;
  Person person;
  ObjectModel object;
  List<Comment> comments;
  User user;

  ItemDetails({this.id, this.creationDate, this.content, this.isLost, this.type, 
    this.images, this.person, this.object, this.comments, this.user});
  
  ItemDetails.fromJson(dynamic data){
    id = data['id'];
    creationDate = data['creationDate'];
    content = data['content'];
    isLost = data['isLost'];
    type = ItemType.values[data['type'] - 1];
    images = data['images'];
    person = Person.fromJson(data['person']);
    object = ObjectModel.fromJson(data['object']);
    comments = List<Comment>.generate(data['comments'].length, (index) => Comment.fromJson(data['comments'][index]));
    user = User.fromJson(data['user']);
  } 
  
}