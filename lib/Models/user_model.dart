
class User{
  int id;
  String name;
  String picture;
  String phoneNumber;
  String address;
  String oldPassword;
  String newPassword;
  String repeatPassword;
  
  User({this.id, this.name, this.picture,this.address,this.phoneNumber,this.oldPassword,this.newPassword,this.repeatPassword});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'address':address,
      'phoneNumber':phoneNumber,
      'oldPassword':oldPassword,
      'newPassword':newPassword,
      'repeatPassword':repeatPassword,};
  }

  User.fromJson(dynamic data) {
    id = data['id'];
    name = data['name'];
    picture = data['picture'];
    address = data['address'];
    phoneNumber = data['phoneNumber'];
    oldPassword = data['oldPassword'];
    newPassword = data['newPassword'];
    repeatPassword = data['repeatPassword'];
  }
}