import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String message;
  final bool read;
  final VoidCallback? onTap;

  const NotificationTile({required this.message, required this.read, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message),
      trailing: read ? null : Icon(Icons.circle, color: Colors.blue, size: 12),
      onTap: onTap,
    );
  }
}
