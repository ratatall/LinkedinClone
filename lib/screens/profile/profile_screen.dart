import 'package:flutter/material.dart';
import '../../widgets/user_avatar.dart';

class ProfileScreen extends StatelessWidget {
  final String name = 'Adilkhan Orakbay';
  final String headline = 'Software Engineer at ...';
  final String bio = 'Passionate about Flutter, check my other GitHub projects!';
  final String avatarUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Center(child: UserAvatar(avatarUrl: avatarUrl, radius: 48)),
            SizedBox(height: 16),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(headline, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
            SizedBox(height: 16),
            Text(bio, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
