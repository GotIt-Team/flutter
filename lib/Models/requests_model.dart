import 'package:gotit/enums/request_state_enum.dart';
import 'package:gotit/models/item_model.dart';
import 'package:gotit/models/user_model.dart';

class Request {
  int id;
  String title;
  String content;
  DateTime sendDate;
  DateTime replyDate;
  String replyMessage;
  RequestState state;
  Item item;
  User sender;
  User receiver;

  Request({
    this.id, 
    this.title, 
    this.content, 
    this.sendDate, 
    this.replyDate, 
    this.replyMessage, 
    this.state, 
    this.item, 
    this.sender, 
    this.receiver
  });

  Request.fromJson(dynamic data) {
    if(data == null) return;
    id = data['id'];
    title = data['title'];
    content = data['content'];
    sendDate = DateTime.parse(data['sendDate'] ?? DateTime.now());
    replyDate = data['replyDate'] != null ? DateTime.parse(data['replyDate']) : null;
    replyMessage = data['replyMessage'];
    state = RequestState.values[data['state'] - 1];
    item = Item.fromJson(data['item']);
    sender = User.fromJson(data['sender']);
    receiver = User.fromJson(data['receiver']);
  }
}