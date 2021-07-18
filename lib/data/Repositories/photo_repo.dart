import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:post_bloc/data/Models/photo.dart';

abstract class PhotoRepository{
  Future<List<Photo>> getAllPhotos();
}

class PhotoRepositoryImplementation extends PhotoRepository{
  @override
  Future<List<Photo>> getAllPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if(response.statusCode==200){
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
    }
    else{
      throw Exception('No Internet Connection');
    }
  }

}

