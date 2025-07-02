import '../models/post.dart';

class PostService {
  List<Post> _posts = [
    Post(id: '1', userId: '1', content: 'Hello LinkedIn!', createdAt: DateTime.now(), likes: [], comments: []),
    Post(id: '2', userId: '2', content: 'Welcome to the clone!', createdAt: DateTime.now(), likes: [], comments: []),
  ];

  List<Post> getAllPosts() => _posts;
  void addPost(Post post) => _posts.add(post);
}
