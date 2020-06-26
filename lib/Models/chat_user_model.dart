import'package:gotit/Models/user_model.dart';
import 'package:gotit/Models/message_model.dart';


class ChatUser {
   int id;
   bool isOnline;
   User user;
  Message lastMessage;

  ChatUser({
    this.id,
    this.user,
    this.lastMessage,
    this.isOnline,});

  ChatUser.fromJson(dynamic data){
    id = data['id'];
    user = User.fromJson(data['user']);
    lastMessage =Message.fromJson(data['lastMessage']);
    isOnline =data['isOnline'];
  }

}