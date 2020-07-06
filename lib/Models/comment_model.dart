import 'package:gotit/models/user_model.dart';

class Comment{
  int id;
  DateTime date;
  String content;
  User user;

  Comment({this.id, this.date, this.content, this.user});

  Comment.fromJson(data) {
    id = data['id'];
    date = data['date'];
    content = data['content'];
    user = User.fromJson(data['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'content': content,
      'user': user.toJson()
    };
  }
}