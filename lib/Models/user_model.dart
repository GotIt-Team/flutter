
class User{
  int id;
  String name;
  String picture;
  
  User({this.id, this.name, this.picture});

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'image': picture,
      'id': id
    };
  }

  User.fromJsom(dynamic data) {
    id = data['id'];
    name = data['name'];
    picture = data['picture'];
  }
}