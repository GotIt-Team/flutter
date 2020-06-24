import 'package:gotit/enums/object_attribute_enum.dart';

class ObjectModel {
  int id;
  String objectClass;
  String colors;
  Map<ObjectAttribute, String> attributes;

  ObjectModel({this.id, this.objectClass, this.colors, this.attributes});

  ObjectModel.fromJson(data) {
    id = data['id'];
    objectClass = data['objectClass'];
    colors = data['colors'];
    attributes = {};
    data['attributes'].forEach((key, value) {
      attributes[ObjectAttribute.values[key]] = value;
    });
  }
}