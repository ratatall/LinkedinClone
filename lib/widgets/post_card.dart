import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String userName;
  final String content;
  final int likes;
  final bool liked;
  final VoidCallback? onLike;
  final VoidCallback? onComment;

  const PostCard({
    required this.userName,
    required this.content,
    required this.likes,
    required this.liked,
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
