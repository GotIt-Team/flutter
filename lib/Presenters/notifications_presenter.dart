import 'package:gotit/models/notifications_model.dart';

class NotificationsPresenter{


  List<Notification> getNotifications(){
    List<Notification> notifications = new List<Notification>();
    notifications.add( new Notification(title: "This is the title of the notification 1",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 2",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 3",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 4",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 5",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 6",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 7",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 8",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 9",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));
    notifications.add( new Notification(title: "This is the title of the notification 10",time: "09.55 AM",icon: "assets/images/Sheka.jpg"));

    
    return notifications;
  }
  
}