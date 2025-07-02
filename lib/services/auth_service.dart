import '../models/user.dart';

class AuthService {
  User? _currentUser;

  User? get currentUser => _currentUser;

  // Hardcoded user
  static const String _hardcodedEmail = 'aa@gmail.com';
  static const String _hardcodedPassword = '1234';

  bool login(String email, String password) {
    if (email == _hardcodedEmail && password == _hardcodedPassword) {
      _currentUser = User(
        id: '1',
        name: 'Hardcoded User',
        email: email,
        headline: 'Flutter Developer',
        avatarUrl: '',
        bio: 'This is a bio.',
      );
      return true;
    }
    return false;
  }

  void logout() {
    _currentUser = null;
  }

  bool register(String name, String email, String password) {
    // Dummy register
    _currentUser = User(
      id: '2',
      name: name,
      email: email,
      headline: '',
      avatarUrl: '',
      bio: '',
    );
    return true;
  }
}
