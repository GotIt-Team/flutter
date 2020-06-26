import 'package:gotit/services/http_service.dart';
import 'package:gotit/models/message_model.dart';
import 'package:gotit/enums/econtent_type_enum.dart';

class ChatRoomPresenter {
  List messageChatList = [];
  Message message;

  Future<void> getMessageChatList(int chatId) async {
    var result = await Http.send<List<Message>>(
        endpointUrl: '',
        queryParameters: {
          'chatId': chatId,
        },
        mapper: (dynamic data) => List<Message>.generate(
            data.length, (index) => Message.fromJson(data[index])));

    if (result.isSucceeded) {
      messageChatList = result.data;
    }
  }

  List<Message> get messageList {
    return messageChatList;
  }

  void sendMessage(EcontentType type, String messageContent) async {
    if (type == EcontentType.text) {
      await Http.send(
        endpointUrl: '',
        method: 'Post',
        body: message.content,
      );
    } else {
      await Http.send(
        endpointUrl: '',
        method: 'Post',
        body: message,
      );
    }
  }
}
