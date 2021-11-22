import 'package:get/get.dart';
import 'package:konachan_viewer/models/post.dart';

class PostController extends GetxController {
  final _posts = <Post>[];

  void addAll(List<Post> posts) {
    if(posts.isNotEmpty) {
      _posts.addAll(posts);
      update();
    }
  }

  void clear() {
    if (_posts.isNotEmpty) {
      _posts.clear();
      update();
    }
  }
}
