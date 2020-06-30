import 'package:flutter/material.dart';
import 'package:gotit/presenters/notifications_presenter.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/notification_card.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationsState();
}


class NotificationsState extends State<NotificationsTab> {
  NotificationsPresenter notificationsPresenter = NotificationsPresenter();
  int notificationCount;
  int pageNo = 1;
  int pageSize = 10;

  void loadNotifications() {
    if(context == null) return;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => notificationsPresenter.getNotifications(pageNo, pageSize).then((value) {
        if(!mounted) return;
        setState(() {
          if(notificationsPresenter.notifications != null){
            notificationCount = notificationsPresenter.notifications.length;
          } else {
            notificationCount = 0;
          }
        });
      })
    );
  }

  @override
  void initState() {
    super.initState();
    notificationCount = 0;
    Future.delayed(Duration.zero, loadNotifications);
  }

  @override
  Widget build(BuildContext context) {
    notificationCount = notificationsPresenter.notifications.length;
    return notificationCount > 0 ? ListView.builder(
      itemCount: notificationCount,
      itemBuilder: (BuildContext context,int index) {
        return NotificationCard(
          id: notificationsPresenter.notifications[index].id,
          content: notificationsPresenter.notifications[index].content,
          date: timeago.format(notificationsPresenter.notifications[index].date),
          isSeen: notificationsPresenter.notifications[index].isSeen,
          link: notificationsPresenter.notifications[index].link,
          userImage: notificationsPresenter.notifications[index].sender.picture,
          userName: notificationsPresenter.notifications[index].sender.name,
        );
      },  
    ) : EmptyState(
      message: 'There is no notifications',
      image: 'assets/images/no_notifications.png'
    );
  }
}
