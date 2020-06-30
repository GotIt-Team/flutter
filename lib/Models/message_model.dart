import 'package:gotit/models/user_model.dart';
import 'package:gotit/enums/content_type_enum.dart';

class Message {
  int id;
  String content;
  DateTime time;
  int senderId;
  User sender;
  ContentType type;

  Message({
    this.id,
    this.sender,
    this.senderId,
    this.content,
    this.time,
    this.type
  });

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'time': time,
      'senderId': senderId,
      'sender':sender.toJson(),
      'content':content,
      'type':type,
    };
  }

  Message.fromJson(dynamic data) {
    if(data == null) return;
    id = data['id'];
    time = DateTime.parse(data['time']);
    content = data['content'];
    type = ContentType.values[data['type'] - 1];
    sender = User.fromJson(data['sender']);
    senderId = data['senderId'];
  }

}






