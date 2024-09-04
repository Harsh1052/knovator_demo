import 'dart:convert';

import 'package:knovator_task/models/api_response.dart';

import '../models/post.dart';
import 'package:http/http.dart' as http;

class APIs{

  final _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<APIResponse<List<Post>>> fetchPosts() async {
    try{
      final response = await http.get(Uri.parse(_baseUrl + '/posts'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return APIResponse(
          data: jsonResponse.map((post) => Post.fromJson(post)).toList(),
        );
      } else {
        return APIResponse(
          error: 'Failed to load posts',
        );
      }
    }catch(e){
      return APIResponse(
        error: 'Failed to load posts + $e',
      );
    }
  }

  Future<APIResponse<Post>> fetchPostDetail(int postId) async {
    try{
      final response = await http.get(Uri.parse('$_baseUrl/posts/$postId'));
      if (response.statusCode == 200) {
        return APIResponse(
          data: Post.fromJson(json.decode(response.body)),
        );
      } else {
        return APIResponse(
          error: 'Failed to load post detail',
        );
      }
    }catch(e){
      return APIResponse(
        error: 'Failed to load post detail + $e',
      );
    }
  }

}