import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'model/post.dart';

Map<String, String> header = {'Content-Type': 'application/json; charset=utf8'};
final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

class PostRepository {
  // EndPoints, DB
  const PostRepository();

  Future<List<Post>> getPostList() async {
    final response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      log('result : (${result[0]}');
      final posts =
          (result as List<dynamic>).map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      return [];
    }
  }

  Future<bool> addPost({required Post post}) async {
    final response =
        await http.post(url, headers: header, body: jsonEncode(post.toJson()));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }
}
