import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_bloc/data/Models/todo.dart';

abstract class ToDoRepository {
  Future<List<ToDos>> getAllToDos();
}

class ToDoRepositoryImplementation extends ToDoRepository {
  @override
  Future<List<ToDos>> getAllToDos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ToDos>((json) => ToDos.fromJson(json)).toList();
    } else {
      throw Exception('No Internet Connection');
    }
  }
}
