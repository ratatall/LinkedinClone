import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/feed/feed_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/connections/connections_screen.dart';
import 'screens/messages/messages_screen.dart';
import 'screens/notifications/notifications_screen.dart';

class LinkedInCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/feed': (context) => FeedScreen(),
        '/profile': (context) => ProfileScreen(),
        '/connections': (context) => ConnectionsScreen(),
        '/messages': (context) => MessagesScreen(),
        '/notifications': (context) => NotificationsScreen(),
      },
    );
  }
}
