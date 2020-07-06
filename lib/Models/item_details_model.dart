
import 'package:gotit/enums/attributes_enum.dart';
import 'package:gotit/enums/item_type.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/models/user_model.dart';

class ItemDetails{
  int id;
  DateTime creationDate;
  String content;
  bool isLost;
  ItemType type;
  List<String> images;
  List<List<int>>boxes;
  Map<Attributes, String> attributes;
  
  User user;

  ItemDetails({this.id, this.creationDate, this.content, this.isLost, this.type, 
    this.images, this.user,this.attributes,this.boxes});
  
  ItemDetails.fromJson(dynamic data){
    id = data['id'];
    creationDate = DateTime.parse(data['creationDate']);
    content = data['content'];
    isLost = data['isLost'];
    type = ItemType.values[data['type'] - 1];
    images = List<String>.generate(data['images'].length, (index) => data['images'][index].toString());
    attributes = {};
    data['attributes'].forEach((key, value) {
      attributes[Helpers.getEnumFromString(Attributes.values, key)] = value;
    });
    user = User.fromJson(data['user']);
  } 
  
}