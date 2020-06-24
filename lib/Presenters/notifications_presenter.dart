import 'package:gotit/models/notifications_model.dart';
import 'package:gotit/services/http_service.dart';

class NotificationsPresenter{
  List<Notification> _notifications = [];
  
  Future<void> getNotifications(int pageNo, int pageSize) async {
    var result = await Http.send<List<Notification>>(
      endpointUrl: 'notification',
      queryParameters: {
        'pageNo': pageNo,
        'pageSize': pageSize
      },
      mapper: (dynamic data) => List<Notification>.generate(data.length, (index) => Notification.fromJson(data[index]))
    );

    if(result.isSucceeded){
      _notifications = result.data;
    }
  }

  List<Notification> get notifications {
    return _notifications;
  }
  
}