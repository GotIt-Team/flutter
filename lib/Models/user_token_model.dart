
class UserToken {
  String name;
  String picture;
  String token;
  String phoneNumber;
  String address;

  UserToken({this.name, this.picture, this.token});

  UserToken.fromJson(dynamic data) {
    if(data != null){
      name = data['name']; 
      picture = data['picture']; 
      token = data['token'];
      phoneNumber = data['phoneNumber'];
      address = data['address'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture': picture,
      'token': token,
      'phoneNumber': phoneNumber,
      'address': address
    };
  }
}