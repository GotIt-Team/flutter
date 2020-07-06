import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gotit/views/widgets/bubble.dart';

import 'package:timeago/timeago.dart' as timeago;

class CommentView extends StatelessWidget {
  
  final DateTime date;
  final String userName;
  final String picture;
  final String content;
  final int index;

  CommentView({
    this.index,
    this.content,
    @required this.date,
    @required this.picture,
    @required this.userName
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(          
          title: Bubble(
            padding: 0,
            alignment: Alignment.centerLeft,
            backgroundColor: Colors.grey[300],
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: userName + '\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: content,
                    )
                  ]),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(picture),
          ),
          subtitle: Text(
              timeago.format(DateTime.now().subtract(Duration(minutes: 5)))),
        ),
        Divider(),
      ],
    );
  }
}
