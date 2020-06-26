import 'package:flutter/material.dart';
import 'package:gotit/enums/econtent_type_enum.dart';
import 'package:gotit/models/Message_model.dart';
import 'package:gotit/models/user_model.dart';
import 'package:gotit/presenters/message_presenter.dart';

class ChatRoomPage extends StatefulWidget {
  final User userChat;
  final Message messageContent;
  final ChatRoomPresenter chatRoomPresenter = ChatRoomPresenter();

  ChatRoomPage({this.userChat, this.messageContent});
  State<StatefulWidget> createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoomPage> {
  final messageTextController = TextEditingController();
  String messageText;
  int chatId;

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Padding(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.80),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ]),
                child: Text(
                  widget.messageContent.content,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                !isSameUser
                    ? Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(2),
                            /////////////////////////// removed condition ////////////////////
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            // BoxDecoration(
                            //     shape: BoxShape.circle,
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: Colors.grey.withOpacity(0.5),
                            //         spreadRadius: 2,
                            //         blurRadius: 5,
                            //       ),
                            //     ]
                            // ),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundImage:
                                  AssetImage(widget.userChat.picture),
                            ),
                          ),
                          Text('${message.time}')
                        ],
                      )
                    : Container(
                        child: null,
                      ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.80),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ]),
              child: Text(widget.messageContent.content),
            ),
          ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.photo_library,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: () {
              print('aa');
            },
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: messageTextController,
              onChanged: (value) {
                widget.chatRoomPresenter.message.content = value;
              },
              decoration: InputDecoration(
                  hintText: 'send Message',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor))),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Theme.of(context).primaryColor,
              size: 25,
            ),
            onPressed: () {
              messageTextController.clear();
              if (messageText.isEmpty) {
                widget.chatRoomPresenter
                    .sendMessage(EcontentType.text, 'welcome');
              } else {
                print('Typing');
              }
            },
          ),
        ],
      ),
    );
  }

  int previousId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(widget.userChat.picture),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(text: widget.userChat.name),
                            TextSpan(text: '\n'),
                            TextSpan(
                              text: 'online',
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: widget.chatRoomPresenter.messageChatList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Message message =
                        widget.chatRoomPresenter.messageChatList[index];
                    final bool currentUser =
                        message.sender.id == widget.userChat.id;
                    final bool isSameUser = previousId == message.sender.id;
                    previousId = message.sender.id;
                    return _chatBubble(message, currentUser, isSameUser);
                  }),
            ),
            _sendMessageArea()
          ],
        ));
  }
}
