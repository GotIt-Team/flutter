import 'package:flutter/material.dart';
import 'package:gotit/presenters/notifications_presenter.dart';
import 'package:gotit/views/widgets/empty_state.dart';
import 'package:gotit/views/widgets/notification_card.dart';
import 'package:gotit/views/widgets/progress_dialog.dart';

class NotificationsTab extends StatefulWidget {
  final NotificationsPresenter notificationsRepository = NotificationsPresenter();
  @override
  State<StatefulWidget> createState() => NotificationsState();
}


class NotificationsState extends State<NotificationsTab> {
  int notificationCount;
  int pageNo = 1;
  int pageSize = 10;

  void loadNotifications() {
    ProgressDialog.show(
      context: context,
      isCircular: false,
      method: () => widget.notificationsRepository.getNotifications(pageNo, pageSize).then((value) {
        setState(() {
          if(widget.notificationsRepository.notifications != null){
            notificationCount = widget.notificationsRepository.notifications.length;
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
    notificationCount = widget.notificationsRepository.notifications.length;
    return notificationCount > 0 ? ListView.builder(
      itemCount: notificationCount,
      itemBuilder: (BuildContext context,int index) {
        return Center(
          child: NotificationCard(
            id: widget.notificationsRepository.notifications[index].id,
            content: widget.notificationsRepository.notifications[index].content,
            date: widget.notificationsRepository.notifications[index].date,
            isSeen: widget.notificationsRepository.notifications[index].isSeen,
            link: widget.notificationsRepository.notifications[index].link,
            userImage: widget.notificationsRepository.notifications[index].sender.picture,
            userName: widget.notificationsRepository.notifications[index].sender.name,
          ),
        );
      },  
    ) : EmptyState(
      message: 'There is no notifications',
      image: 'assets/images/no_notifications.png'
    );
  }
}
