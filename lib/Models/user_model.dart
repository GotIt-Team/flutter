
class User{
  int id;
  String name;
  String picture;
  String phoneNumber;
  String address;
  
  User({this.id, this.name, this.picture,this.address,this.phoneNumber});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'address': address,
      'phoneNumber': phoneNumber
    };
  }

  User.fromJson(dynamic data) {
    id = data['id'];
    name = data['name'];
    picture = data['picture'];
    address = data['address'];
    phoneNumber = data['phoneNumber'];
  }
}