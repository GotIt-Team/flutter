import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/ui_elements/cached_image_element.dart';
import 'package:gotit/views/widgets/bubble.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final DateTime time;
  final String userImage;
  final bool isMe;

  ChatBubble({this.message, this.time, this.userImage, this.isMe});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: !isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget> [
          !isMe ? Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: CachedImage.provider(userImage),
            ),
          ) : Container(),
          Bubble(
            backgroundColor: isMe ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.surface,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 48.0),
                  child: Text(message, style: TextStyle(color: isMe ? Colors.white : Colors.black)),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Text(DateFormat.Hm().format(time),
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                      fontSize: 10.0,
                    )
                  )
                )
              ],
            ),
          ),
        ]
      ),
    );
  }
}