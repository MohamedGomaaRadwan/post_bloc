import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:post_bloc/data/Models/post.dart';

abstract class PostRepository{
  Future<List<Post>> getAllPosts();
}

class PostRepositoryImplementation extends PostRepository{
  @override
  Future<List<Post>> getAllPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if(response.statusCode==200){
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((json) => Post.fromJson(json)).toList();
    }
    else{
      throw Exception('No Internet Connection');
    }
  }

}

