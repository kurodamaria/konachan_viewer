import 'dart:convert';

import 'package:get/get.dart';
import 'package:konachan_viewer/models/post.dart';

/// command center of network

// const _kBaseUrl = 'https://konachan.net';
// const _kApiPosts = _kBaseUrl + '/post.json';
// const _kApiTags = _kBaseUrl + '/tag.json';
// const _kApiArtists = _kBaseUrl + '/artist.json';
// const _kApiComments = _kBaseUrl + '/comment.json';
// const _kApiWiki = _kBaseUrl + '/wiki.json';
// const _kApiNotes = _kBaseUrl + '/note.json';
// const _kApiUsers = _kBaseUrl + '/user.json';
// const _kApiForum = _kBaseUrl + '/forum.json';
// const _kApiPool = _kBaseUrl + '/pool.json';

// final _kResponseCodeToMessage = {
//   200: 'OK: Request was successful',
//   403: 'Access denied',
//   404: 'Not Found',
//   420: 'Invalid Record: Record could not be saved',
//   421: 'User Throttled: User is throttled, try again later',
//   422: 'Locked: The resource if locked and cannot be modified',
//   423: 'Already Exists: Resource already exists',
//   424: 'Invalid Parameters: The given parameters were invalid',
//   500: 'Internal Server Error: Some unknown error occurred on the server',
//   503:
//       'Service Unavailable: Server cannot currently handle the request, try again later'
// };

/// for test
const _kRawPostJson =
    '{"id":334771,"tags":"2girls car gloves goggles green_eyes gun jpc original purple_eyes weapon","created_at":1637545469,"creator_id":41748,"author":"FormX","change":2074408,"source":"https://www.pixiv.net/en/artworks/92830607","score":0,"md5":"0a8bbd7c3097cbe64c5dbf6e517d301f","file_size":4727932,"file_url":"https://konachan.net/image/0a8bbd7c3097cbe64c5dbf6e517d301f/Konachan.com%20-%20334771%202girls%20car%20gloves%20goggles%20green_eyes%20gun%20jpc%20original%20purple_eyes%20weapon.jpg","is_shown_in_index":true,"preview_url":"https://konachan.net/data/preview/0a/8b/0a8bbd7c3097cbe64c5dbf6e517d301f.jpg","preview_width":150,"preview_height":98,"actual_preview_width":300,"actual_preview_height":196,"sample_url":"https://konachan.net/sample/0a8bbd7c3097cbe64c5dbf6e517d301f/Konachan.com%20-%20334771%20sample.jpg","sample_width":1500,"sample_height":979,"sample_file_size":1068547,"jpeg_url":"https://konachan.net/image/0a8bbd7c3097cbe64c5dbf6e517d301f/Konachan.com%20-%20334771%202girls%20car%20gloves%20goggles%20green_eyes%20gun%20jpc%20original%20purple_eyes%20weapon.jpg","jpeg_width":3000,"jpeg_height":1957,"jpeg_file_size":0,"rating":"s","has_children":false,"parent_id":null,"status":"active","width":3000,"height":1957,"is_held":false,"frames_pending_string":"","frames_pending":[],"frames_string":"","frames":[]}';

class PostListProvider extends GetConnect {
  @override
  void onInit() {
    Get.log('oninit');
    httpClient.baseUrl = 'https://konachan.net';
    httpClient.defaultDecoder = (dynamic responseBody) {
      return (responseBody as List<dynamic>).map((e) => Post.fromJson(e));
    };
    httpClient.addRequestModifier<Object?>((request) {
      Get.log('PostListProvider: request url: ${request.url}');
      return request;
    });
  }

  test() {
    get('post.json', query: {'page': '12'});
  }

  Future<Iterable<Post>> listPosts(
      {int? limit, int? page, List<String>? tags}) async {
    final additionalParameter = [
      if (page != null) 'page=$page',
      if (limit != null) 'limit=$limit',
      if (tags != null && tags.isNotEmpty) tags.join('+')
    ];

    final hasAdditionalQuery = additionalParameter.isNotEmpty;

    final resp = await get(
        hasAdditionalQuery ? '?' + additionalParameter.join('&') : '');

    return (resp.body as List<dynamic>).map((e) => Post.fromJson(e));
  }

  Post getTestPost() {
    return Post.fromJson(jsonDecode(_kRawPostJson));
  }
}

class Network extends GetxController {
  final _postProvider = PostListProvider();

  updatePost({String? tag}) async {
    final posts = Get.find<RxList<Post>>(tag: tag);
    posts.value = (await _postProvider.listPosts()).toList();
    posts.refresh();
  }

  addTestPost({String? tag}) {
    final posts = Get.find<RxList<Post>>(tag: tag);
    posts.add(_postProvider.getTestPost());
  }

  testPostProvider() {
    _postProvider.test();
  }
}
