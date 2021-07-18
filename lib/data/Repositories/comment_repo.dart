import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:post_bloc/data/Models/comment.dart';

abstract class CommentRepository{
  Future<List<Comment>> getAllComments();
}

class CommentRepositoryImplementation extends CommentRepository{
  @override
  Future<List<Comment>> getAllComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if(response.statusCode==200){
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Comment>((json) => Comment.fromJson(json)).toList();
    }
    else{
      throw Exception('No Internet Connection');
    }
  }
}
