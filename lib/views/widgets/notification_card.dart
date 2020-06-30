import 'package:flutter/material.dart';
import 'package:gotit/helpers.dart';
import 'package:gotit/presenters/notifications_presenter.dart';

class NotificationCard extends StatelessWidget {
  final int id; 
  final String link; 
  final String content; 
  final String date;
  final bool isSeen;
  final String userName;
  final String userImage;
  final NotificationsPresenter _notificationPresenter = NotificationsPresenter();
  NotificationCard({this.id, this.link, this.content, this.date, this.isSeen, this.userName, this.userImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
        top: MediaQuery.of(context).size.width * 0.01
      ),
      height: 115,
      child: InkWell(
        onTap: () {
          _notificationPresenter.readNotification(id);
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
              subtitle: Text(date),
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