import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_bloc/data/Models/user/user.dart';

abstract class UserRepository {
  Future<List<User>> getAllUsers();
}

class UserRepositoryImplementation extends UserRepository {
  @override
  Future<List<User>> getAllUsers() async {
    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('No Internet Connection');
    }
  }
}
