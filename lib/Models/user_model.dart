
import 'package:gotit/enums/user_type_enum.dart';

class User{
  int id;
  String name;
  String picture;
  String phoneNumber;
  String address;
  String token;
  UserType type;
  
  User({this.id, this.name, this.picture,this.address,this.phoneNumber});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'address': address,
      'phoneNumber': phoneNumber,
      'token': token,
      'type': type.index + 1
    };
  }

  User.fromJson(dynamic data) {
    if(data == null) return;
    id = data['id'];
    name = data['name'];
    picture = data['picture'];
    token = data['token'];
    phoneNumber = data['phoneNumber'];
    address = data['address'];
    type = data['type'] > 0 ? UserType.values[data['type'] - 1] : null;
  }
}