import 'package:flutter/material.dart';
import 'package:gotit/presenters/chat_presenter.dart';
import 'package:gotit/services/validator_service.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';
import 'package:gotit/views/widgets/chat_bubble.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class ChatRoomPage extends StatefulWidget {
  final int id;
  final String userName;
  final String userImage;
  ChatRoomPage({this.id, this.userName, this.userImage});

  @override
  State<StatefulWidget> createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoomPage> {
  final TextEditingController _controller = TextEditingController();
  ChatPresenter chatPresenter = ChatPresenter();
  int messageCount = 0;
  
  Future<void> loadMessages() async {
    if(context == null) return;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () =>  chatPresenter.getMessages(widget.id).then((value) {
        if(!mounted) return;
        setState(() {
          if(chatPresenter.messages != null) {
            messageCount = chatPresenter.messages.length;
          } else {
            messageCount = 0;
          }
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, loadMessages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
              backgroundImage: CachedImage.provider(widget.userImage)),
          title: Text(
            widget.userName,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        )
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: messageCount > 0 ? ListView.builder(
                itemCount: messageCount,
                itemBuilder: (BuildContext context, int index) {
                  var message = chatPresenter.messages[index];
                  bool isMe = message.senderId == chatPresenter.userId;
                  return ChatBubble(
                    isMe: isMe,
                    message: message.content,
                    time: message.time,
                    userImage: widget.userImage
                  );
                }
              ) : EmptyState(
                image: 'assets/images/no_messages.png',
                message: 'There is no message between both of you',
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Type a message",
                  fillColor: Theme.of(context).colorScheme.surface,
                  filled: true,
                ),
                controller: _controller
              ),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    if (Validator.requiredField(_controller.text) != null) return;
                    chatPresenter.sendMessage(_controller.text).then((value){
                      _controller.clear();
                      messageCount = chatPresenter.messages.length;
                    });
                  });
                },
                child: Icon(Icons.send, size: 36)
              )
            )
          ]
        ),
      )
    );
  }
}
