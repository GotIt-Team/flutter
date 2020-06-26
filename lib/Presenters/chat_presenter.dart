import 'package:gotit/services/http_service.dart';
import 'package:gotit/models/chat_user_model.dart';


class ChatListPresenter {

  List userChatList = [];

  Future<void> getChatList() async {
    var result = await Http.send<List<ChatUser>>(
        endpointUrl: '',
        mapper: (dynamic data) => List<ChatUser>.generate(data.length, (index) => ChatUser.fromJson(data[index]))
    );

    if(result.isSucceeded){
      userChatList = result.data;
    }
  }

  List<ChatUser> get chatList {
    return userChatList;
  }



}