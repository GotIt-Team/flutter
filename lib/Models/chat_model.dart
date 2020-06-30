import'package:gotit/models/user_model.dart';
import 'package:gotit/models/message_model.dart';


class Chat {
  int id;
  bool isOnline;
  User user;
  Message lastMessage;

  Chat({this.id, this.user, this.lastMessage, this.isOnline});

  Chat.fromJson(dynamic data){
    id = data['id'];
    isOnline = data['isOnline'];
    user = User.fromJson(data['user']);
    lastMessage = Message.fromJson(data['lastMessage']);
  }

}