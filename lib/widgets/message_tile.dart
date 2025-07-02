import 'package:flutter/material.dart';

class MessageTile extends StatelessWidget {
  final String sender;
  final String message;
  final VoidCallback? onTap;

  const MessageTile({required this.sender, required this.message, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(sender),
      subtitle: Text(message),
      onTap: onTap,
    );
  }
}
