import 'package:flutter/material.dart';
import '../../widgets/message_tile.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  final List<Map<String, String>> _messages = const [
    {
      'sender': 'James Wong',
      'message': 'Hi! Are you available for a quick call?'
    },
    {
      'sender': 'Bob Lee',
      'message': 'Congrats on your new job!'
    },
    {
      'sender': 'Charlie Kim',
      'message': 'Can you review my latest PR?'
    },
    {
      'sender': 'Morty Smith',
      'message': 'Let’s catch up tomorrow!'
    },
  ];

  void _openChat(BuildContext context, String sender, String message) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(sender: sender, message: message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final msg = _messages[index];
          return MessageTile(
            sender: msg['sender']!,
            message: msg['message']!,
            onTap: () => _openChat(context, msg['sender']!, msg['message']!),
          );
        },
      ),
    );
  }
}
