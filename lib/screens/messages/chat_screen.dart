import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String otherUserId;
  const ChatScreen({required this.otherUserId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Center(child: Text('Chat with $otherUserId')),
    );
  }
}
