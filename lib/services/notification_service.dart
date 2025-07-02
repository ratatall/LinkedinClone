import '../models/notification.dart';

class NotificationService {
  List<AppNotification> _notifications = [];

  List<AppNotification> getNotifications(String userId) =>
    _notifications.where((n) => n.userId == userId).toList();

  void addNotification(AppNotification notification) => _notifications.add(notification);
}
