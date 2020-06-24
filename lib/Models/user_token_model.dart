
class UserToken {
  String name;
  String picture;
  String token;

  UserToken(this.name, this.picture, this.token);

  UserToken.fromJson(dynamic data) {
    if(data != null){
      name = data['name']; 
      picture = data['picture']; 
      token = data['token'];
    }
  }
}