import '../models/message.dart';

class MessageService {
  List<Message> _messages = [];

  List<Message> getMessages(String userId, String otherId) =>
    _messages.where((m) => (m.senderId == userId && m.receiverId == otherId) || (m.senderId == otherId && m.receiverId == userId)).toList();

  void sendMessage(Message message) => _messages.add(message);
}
