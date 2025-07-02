import 'package:flutter/material.dart';
import '../../widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _notifications = const [
    {
      'message': 'Alice Johnson liked your post.',
      'read': false
    },
    {
      'message': 'Bob Lee sent you a connection request.',
      'read': true
    },
    {
      'message': 'Charlie Kim commented on your post.',
      'read': false
    },
    {
      'message': 'Diana Smith viewed your profile.',
      'read': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notif = _notifications[index];
          return NotificationTile(
            message: notif['message']!,
            read: notif['read']!,
            onTap: () {},
          );
        },
      ),
    );
  }
}
