

import 'package:bottomnavegationbar/src/models/PostsModel.dart';
import 'package:bottomnavegationbar/src/resources/PostsApi.dart';

class PostRepository {
  final postsApi = PostApi();

  Future<List<PostsModel>> getPosts() => postsApi.getPosts();

}