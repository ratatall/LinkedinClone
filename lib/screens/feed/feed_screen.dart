import 'package:flutter/material.dart';
import '../../widgets/post_card.dart';
import 'create_post_dialog.dart';

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
      'comments': <String>[],
    },
    {
      'userName': 'Bob Lee',
      'content': 'Just published a new article on LinkedIn, check it out!',
      'likes': 0,
      'liked': false,
      'comments': <String>[],
    },
    {
      'userName': 'Charlie Kim',
      'content': 'Looking for a Flutter developer to join our team!',
      'likes': 0,
      'liked': false,
      'comments': <String>[],
    },
    {
      'userName': 'James Wong',
      'content': 'I will be at uni tomorrow. Let me know if you are here!',
      'likes': 0,
      'liked': false,
      'comments': <String>[],
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

  void _createPost() async {
    final userName = 'Adilkhan Orakbay';
    final content = await showDialog<String>(
      context: context,
      builder: (context) => CreatePostDialog(userName: userName),
    );
    if (content != null && content.isNotEmpty) {
      setState(() {
        _news.insert(0, {
          'userName': userName,
          'content': content,
          'likes': 0,
          'liked': false,
          'comments': <String>[],
        });
      });
    }
  }

  void _addComment(int index) async {
    final comment = await showDialog<String>(
      context: context,
      builder: (context) => _CommentDialog(),
    );
    if (comment != null && comment.isNotEmpty) {
      setState(() {
        (_news[index]['comments'] as List<String>).add(comment);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Create Post',
            onPressed: _createPost,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          final news = _news[index];
          return PostCard(
            userName: news['userName'],
            content: news['content'],
            likes: news['likes'],
            liked: news['liked'],
            comments: List<String>.from(news['comments'] ?? []),
            onLike: () => _likePost(index),
            onComment: () => _addComment(index),
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

class _CommentDialog extends StatefulWidget {
  @override
  State<_CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<_CommentDialog> {
  final _formKey = GlobalKey<FormState>();
  String _comment = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(_comment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Comment'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 3,
          decoration: InputDecoration(labelText: 'Your comment'),
          validator: (value) => value == null || value.isEmpty ? 'Enter a comment' : null,
          onSaved: (value) => _comment = value ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Post'),
        ),
      ],
    );
  }
}
