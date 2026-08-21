import 'package:offline_first/domain/entities/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();
}
