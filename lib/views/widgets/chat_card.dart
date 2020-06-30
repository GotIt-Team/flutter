import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/enums/content_type_enum.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/views/pages/chat_room_view.dart';

class ChatCard extends StatelessWidget {
  final int id;
  final String userName;
  final String lastMessage;
  final String image;
  final String time;
  final ContentType type;

  ChatCard({this.id, this.userName, this.lastMessage, this.image, this.time, this.type});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoomPage(
        id: id,
        userName: userName,
        userImage: image
      ))),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(image),
      ),
      title: Text(userName),
      subtitle: type == ContentType.text ? Text(Helpers.truncateWithEllipsis(lastMessage, 30)) : 
      Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.perm_media, color: Theme.of(context).textTheme.subtitle.color),
          ),
          Text(Helpers.getStringFromEnum(type))
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(onTap: () => print('hello'), child: Icon(Icons.more_horiz)),
          Text(time),
        ],
      ),
    );
  }
}