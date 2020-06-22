import 'package:flutter/material.dart';
import 'package:gotit/presenters/notifications_presenter.dart';

NotificationsPresenter notificationsRepository = NotificationsPresenter();
var notifications = notificationsRepository.getNotifications();
class NotificationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5.0),
        children: List.generate(notifications.length, (index) {
          return Center(
            child: NotificationCard(index: index,),
          );
        }));
  }
}

class NotificationCard extends StatelessWidget {
  final int index;
  NotificationCard({this.index});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () {
          //the function of clicked notification
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            color: Colors.white,
            child: Column(
              children: [
                new ListTile(
                    //title and time
                    title: Text(notifications.elementAt(index).title),
                    subtitle: Text(notifications.elementAt(index).time),
                    //profile icon
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(notifications.elementAt(index).icon),
                    )),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )));
  }
}
