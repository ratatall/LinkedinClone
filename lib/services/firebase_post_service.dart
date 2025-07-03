import 'package:firebase_database/firebase_database.dart';

class FirebasePostService {
  final DatabaseReference _postsRef = FirebaseDatabase.instance.ref('posts');

  Future<void> createPost(Map<String, dynamic> post) async {
    await _postsRef.push().set(post);
  }

  Stream<DatabaseEvent> getPostsStream() {
    return _postsRef.onValue;
  }

  Future<void> updatePost(String postId, Map<String, dynamic> data) async {
    await _postsRef.child(postId).update(data);
  }

  Future<void> deletePost(String postId) async {
    await _postsRef.child(postId).remove();
  }
}
