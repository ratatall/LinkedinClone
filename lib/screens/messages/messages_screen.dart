import 'package:flutter/material.dart';
import '../../widgets/message_tile.dart';

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
            onTap: () {},
          );
        },
      ),
    );
  }
}
