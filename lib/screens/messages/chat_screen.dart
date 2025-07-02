import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String sender;
  final String message;
  const ChatScreen({required this.sender, required this.message, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat with $sender')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From: $sender', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text(message, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
