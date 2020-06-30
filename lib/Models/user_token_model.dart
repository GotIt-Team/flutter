
class UserToken {
  int id;
  String name;
  String picture;
  String token;
  String phoneNumber;
  String address;

  UserToken({this.id, this.name, this.picture, this.token, this.phoneNumber, this.address});

  UserToken.fromJson(dynamic data) {
    if(data == null) return;
    id = data['id'];
    name = data['name']; 
    picture = data['picture']; 
    token = data['token'];
    phoneNumber = data['phoneNumber'];
    address = data['address'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'token': token,
      'phoneNumber': phoneNumber,
      'address': address
    };
  }
}