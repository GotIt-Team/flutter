
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/models/user_model.dart';

class Item{
  int id;
  String content;
  DateTime creationDate;
  String image;
  ItemType type;
  User user;
  
  Item({this.id, this.content, this.creationDate, this.image, this.type, this.user});

  Item.fromJson(dynamic data) {
    id = data['id'];
    content = data['content'];
    creationDate = DateTime.parse(data['creationDate']);
    image = data['image'];
    type = ItemType.values[data['type'] - 1];
    user = User.fromJsom(data['user']);
  }
}