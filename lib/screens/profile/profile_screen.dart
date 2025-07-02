import 'package:flutter/material.dart';
import '../../widgets/user_avatar.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Adilkhan Orakbay';
  String headline = 'Software Engineer at ...';
  String bio = 'Passionate about Flutter, check my other GitHub projects!';
  String avatarUrl = '';

  void _editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          initialName: name,
          initialBio: bio,
          initialAvatarUrl: avatarUrl,
        ),
      ),
    );
    if (result != null && result is Map) {
      setState(() {
        name = result['name'] ?? name;
        bio = result['bio'] ?? bio;
        avatarUrl = result['avatarUrl'] ?? avatarUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: _editProfile,
        ),
      ]),
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
