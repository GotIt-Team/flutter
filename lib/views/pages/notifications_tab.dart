import 'package:flutter/material.dart';
import 'package:gotit/presenters/notifications_presenter.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/notification_card.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class NotificationsTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NotificationsState();
}


class NotificationsState extends State<NotificationsTab> {
  NotificationsPresenter notificationsRepository = NotificationsPresenter();
  int notificationCount;
  int pageNo = 1;
  int pageSize = 10;

  void loadNotifications() {
    if(context == null) return;
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => notificationsRepository.getNotifications(pageNo, pageSize).then((value) {
        if(!mounted) return;
        setState(() {
          if(notificationsRepository.notifications != null){
            notificationCount = notificationsRepository.notifications.length;
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
    notificationCount = notificationsRepository.notifications.length;
    return notificationCount > 0 ? ListView.builder(
      itemCount: notificationCount,
      itemBuilder: (BuildContext context,int index) {
        return NotificationCard(
          id: notificationsRepository.notifications[index].id,
          content: notificationsRepository.notifications[index].content,
          date: notificationsRepository.notifications[index].date,
          isSeen: notificationsRepository.notifications[index].isSeen,
          link: notificationsRepository.notifications[index].link,
          userImage: notificationsRepository.notifications[index].sender.picture,
          userName: notificationsRepository.notifications[index].sender.name,
        );
      },  
    ) : EmptyState(
      message: 'There is no notifications',
      image: 'assets/images/no_notifications.png'
    );
  }
}
