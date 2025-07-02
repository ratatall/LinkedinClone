import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  final List<String> comments;
  const CommentSection({required this.comments, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: comments.map((c) => Padding(
        padding: EdgeInsets.symmetric(vertical: 2),
        child: Text(c),
      )).toList(),
    );
  }
}
