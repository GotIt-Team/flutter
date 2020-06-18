
class User{
  String name;
  String image;
  int id;
  User({this.id,this.name, this.image});

  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'image': image,
      'id': id
    };
  }
}