import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final int id; 
  final String link; 
  final String content; 
  final DateTime date;
  final bool isSeen;
  final String userName;
  final String userImage;
  NotificationCard({this.id, this.link, this.content, this.date, this.isSeen, this.userName, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 5
      ),
      height: 115,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, link);
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: !isSeen ? BorderSide(color: Theme.of(context).primaryColor, width: 2.0) : BorderSide.none,
          ),
          child: Center(
            child: ListTile(
              //title and time
              title: Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  top: 8
                ),
                child: Text(Helpers.truncateWithEllipsis(content, 90)),
              ),
              subtitle: Text(DateFormat().format(date)),
              //profile icon
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/Sheka.jpg"),
              )
            ),
          ),
        )
      ),
    );
  }
}