import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final String postId;
  const PostDetailScreen({required this.postId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Detail')),
      body: Center(child: Text('Post details for $postId')),
    );
  }
}
