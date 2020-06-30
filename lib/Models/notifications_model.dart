import 'package:gotit/enums/notification_type.dart';
import 'package:gotit/models/user_model.dart';

class Notification{
  int id; 
  String link; 
  String content;
  DateTime date; 
  bool isSeen;
  NotificationType type;
  User sender;

  Notification({this.id, this.link, this.content, this.date, this.isSeen, this.type, this.sender});
  
  Notification.fromJson(dynamic data){
    id = data['id'];
    link = data['link'];
    content = data['content'];
    date = DateTime.tryParse(data['date'] ?? DateTime.now());
    isSeen = data['isSeen'];
    type = NotificationType.values[data['type'] - 1];
    sender = User.fromJson(data['sender']);
  }
}