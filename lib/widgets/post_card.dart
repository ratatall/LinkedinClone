import 'package:flutter/material.dart';
import 'comment_section.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String content;
  final int likes;
  final bool liked;
  final List<String> comments;
  final VoidCallback? onLike;
  final VoidCallback? onComment;

  const PostCard({
    required this.userName,
    required this.content,
    required this.likes,
    required this.liked,
    required this.comments,
    this.onLike,
    this.onComment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userName, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(content),
            if (comments.isNotEmpty) ...[
              SizedBox(height: 12),
              Text('Comments:', style: TextStyle(fontWeight: FontWeight.bold)),
              CommentSection(comments: comments),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('$likes'),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: liked ? Colors.blue : null,
                  ),
                  onPressed: onLike,
                ),
                IconButton(icon: Icon(Icons.comment), onPressed: onComment),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
