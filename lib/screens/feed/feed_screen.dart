import 'package:flutter/material.dart';
import '../../widgets/post_card.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, dynamic>> _news = [
    {
      'userName': 'Rick Smith',
      'content': 'Excited to join a new Flutter project with you all!',
      'likes': 0,
      'liked': false,
    },
    {
      'userName': 'Bob Lee',
      'content': 'Just published a new article on LinkedIn, check it out!',
      'likes': 0,
      'liked': false,
    },
    {
      'userName': 'Charlie Kim',
      'content': 'Looking for a Flutter developer to join our team!',
      'likes': 0,
      'liked': false,
    },
    {
      'userName': 'James Wong',
      'content': 'I will be at uni tomorrow. Let me know if you are here!',
      'likes': 0,
      'liked': false,
    },
  ];

  void _likePost(int index) {
    setState(() {
      if (!_news[index]['liked']) {
        _news[index]['likes']++;
        _news[index]['liked'] = true;
      } else {
        _news[index]['likes']--;
        _news[index]['liked'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feed')),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final news = _news[index];
          return PostCard(
            userName: news['userName'],
            content: news['content'],
            likes: news['likes'],
            liked: news['liked'],
            onLike: () => _likePost(index),
            onComment: () {},
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Profile'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              title: Text('Connections'),
              onTap: () => Navigator.pushNamed(context, '/connections'),
            ),
            ListTile(
              title: Text('Messages'),
              onTap: () => Navigator.pushNamed(context, '/messages'),
            ),
            ListTile(
              title: Text('Notifications'),
              onTap: () => Navigator.pushNamed(context, '/notifications'),
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }
}
