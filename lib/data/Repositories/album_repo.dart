import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:post_bloc/data/Models/album.dart';

abstract class AlbumRepository{
  Future<List<Album>> getAllAlbums();
}

class AlbumRepositoryImplementation extends AlbumRepository{
  @override
  Future<List<Album>> getAllAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if(response.statusCode==200){
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Album>((json) => Album.fromJson(json)).toList();
    }
    else{
      throw Exception('No Internet Connection');
    }
  }


}

