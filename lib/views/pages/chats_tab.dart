import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/content_type_enum.dart';
import 'package:gotit/presenters/chat_presenter.dart';
import 'package:gotit/views/widgets/chat_card.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatsTab extends StatefulWidget {
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<ChatsTab> {
  ChatPresenter chatPresenter = ChatPresenter();
  int chatCount;

  void loadChats() {
    if(context == null) return;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => chatPresenter.getChats().then((value) {
        if(!mounted) return;
        setState(() {
          if(chatPresenter.chats != null){
            chatCount = chatPresenter.chats.length;
          } else {
            chatCount = 0;
          }
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    chatCount = 0;
    Future.delayed(Duration.zero, loadChats);
  }

  @override
  Widget build(BuildContext context) {
    return chatCount > 0 ? Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.builder(
        itemCount: chatCount,
        itemBuilder: (BuildContext context, int index) {
          var chat = chatPresenter.chats[index];
          return ChatCard(
            id: chat.id,
            lastMessage: chat.lastMessage?.content != null ? chat.lastMessage.content : 'no messages start chat now',
            time: chat.lastMessage?.time != null ? timeago.format(chat.lastMessage.time) : '',
            userName: chat.user.name,
            type: chat.lastMessage?.type != null ? chat.lastMessage.type : ContentType.text,
            image: 'assets/images/Sheka.jpg',
          );
        }
      ),
    ) : EmptyState(
      image: 'assets/images/no_messages.png',
      message: 'There is no chat',
    );
  }
}
