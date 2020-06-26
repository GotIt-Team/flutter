import 'package:gotit/models/user_model.dart';
import 'package:gotit/enums/econtent_type_enum.dart';

class Message{
  int id;
  String content;
  DateTime time;
  User sender;
  EcontentType type;

  Message({
    this.id,
    this.sender,
    this.content,
    this.time,
    this.type,
  });

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'time': time,
      'sender':sender.toJson(),
      'content':content,
      'type':type,
    };
  }

  Message.fromJson(dynamic data) {
    id = data['id'];
    time = data['time'];
    content = data['content'];
    type = data['type'];
    sender=User.fromJson(data['sender']);

  }

}






