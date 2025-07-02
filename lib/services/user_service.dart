import '../models/user.dart';

class UserService {
  List<User> _users = [
    User(id: '1', name: 'John Doe', email: 'john@example.com', headline: 'Flutter Dev', avatarUrl: '', bio: 'Bio'),
    User(id: '2', name: 'Jane Smith', email: 'jane@example.com', headline: 'Designer', avatarUrl: '', bio: 'Bio'),
  ];

  User? getUserById(String id) => _users.firstWhere((u) => u.id == id, orElse: () => User(id: '', name: '', email: '', headline: '', avatarUrl: '', bio: ''));
  List<User> getAllUsers() => _users;
}
