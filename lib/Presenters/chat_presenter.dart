import 'package:gotit/services/http_service.dart';
import 'package:gotit/models/chat_model.dart';
import 'package:gotit/models/Message_model.dart';
import 'package:gotit/services/user_data_service.dart';
import 'package:gotit/enums/content_type_enum.dart';


class ChatPresenter {
  List<Chat> _chats = [];
  List<Message> _messages = [];

  Future<void> getChats() async {
    var result = await Http.send<List<Chat>>(
      endpointUrl: 'chat',
      mapper: (dynamic data) => data !=  null ? List<Chat>.generate(data.length, (index) => Chat.fromJson(data[index])) : []
    );

    if(result.isSucceeded){
      _chats = result.data;
    }
  }

  Future<void> getMessages(int chatId) async {
    var result = await Http.send<List<Message>>(
      endpointUrl: '${'chat/$chatId'}',
      mapper: (dynamic data) => data !=  null ? List<Message>.generate(data.length, (index) => Message.fromJson(data[index])) : []
    );

    if(result.isSucceeded){
      _messages = result.data;
    }
  }

  Future<void> sendMessage(String text) async {
    _messages.add(Message(
      content: text,
      type: ContentType.text,
      time: DateTime.now(),
      senderId: userId
    ));
  }

  List<Chat> get chats {
    return _chats;
  }

  List<Message> get messages {
    return _messages;
  }

  int get userId {
    return UserData.user.id;
  }
}