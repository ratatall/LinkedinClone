class Post {
  final String id;
  final String userId;
  final String content;
  final DateTime createdAt;
  final List<String> likes;
  final List<String> comments;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.likes,
    required this.comments,
  });
}
