import 'package:clone_flutter/services/firebase_post_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../widgets/post_card.dart';
class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FirebasePostService _postService = FirebasePostService();

  void _createPost() async {
    final userName = 'Adilkhan Orakbay';
    final content = await showDialog<String>(
      context: context,
      builder: (context) => _CreatePostDialog(userName: userName),
    );
    if (content != null && content.isNotEmpty) {
      await _postService.createPost({
        'userName': userName,
        'content': content,
        'likes': 0,
        'liked': false,
        'comments': <String>[],
      });
    }
  }

  void _likePost(String postId, Map post) async {
    final liked = post['liked'] ?? false;
    final likes = post['likes'] ?? 0;
    await _postService.updatePost(postId, {
      'likes': liked ? likes - 1 : likes + 1,
      'liked': !liked,
    });
  }

  void _addComment(String postId, Map post) async {
    final comment = await showDialog<String>(
      context: context,
      builder: (context) => _CommentDialog(),
    );
    if (comment != null && comment.isNotEmpty) {
      final comments = List<String>.from(post['comments'] ?? []);
      comments.add(comment);
      await _postService.updatePost(postId, {'comments': comments});
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
      body: StreamBuilder<DatabaseEvent>(
        stream: _postService.getPostsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
            return Center(child: Text('No posts yet.'));
          }
          final postsMap = Map<String, dynamic>.from(snapshot.data!.snapshot.value as Map);
          final posts = postsMap.entries.toList().reversed.toList();
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final entry = posts[index];
              final postId = entry.key;
              final post = Map<String, dynamic>.from(entry.value);
              return PostCard(
                userName: post['userName'] ?? '',
                content: post['content'] ?? '',
                likes: post['likes'] ?? 0,
                liked: post['liked'] ?? false,
                comments: List<String>.from(post['comments'] ?? []),
                onLike: () => _likePost(postId, post),
                onComment: () => _addComment(postId, post),
              );
            },
          );
        },
      ),
    );
  }
}

class _CreatePostDialog extends StatefulWidget {
  final String userName;
  const _CreatePostDialog({required this.userName, Key? key}) : super(key: key);
  @override
  State<_CreatePostDialog> createState() => _CreatePostDialogState();
}
class _CreatePostDialogState extends State<_CreatePostDialog> {
  final _formKey = GlobalKey<FormState>();
  String _content = '';
  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(_content);
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Post'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          maxLines: 4,
          decoration: InputDecoration(labelText: 'What do you want to talk about?'),
          validator: (value) => value == null || value.isEmpty ? 'Enter something' : null,
          onSaved: (value) => _content = value ?? '',
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
