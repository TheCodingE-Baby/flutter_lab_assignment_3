import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;
import '../models/album_model.dart';
import '../models/photo_model.dart';


class ApiServices{
  final http.Client client;
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  ApiServices({required this.client});

  Future<List<AlbumModel>> getAlbums() async {
    final response = await client.get(Uri.parse('$baseUrl/albums'));
    if (response.statusCode == 200) {
      final albums = jsonDecode(response.body) as List;
      return albums.map((album) => AlbumModel.fromJson(album)).toList();
    } else {
      throw Exception('Failed to load albums');
    }
  }

  Future<List<AlbumModel>> getPhotosByAlbumId(int albumId) async {
    final response = await client.get(Uri.parse('$baseUrl/albums/$albumId/photos'));
    if (response.statusCode == 200) {
      final photos = jsonDecode(response.body) as List;
      return photos.map((photo) => AlbumModel.fromJson(photo)).toList();
    } else {
      throw Exception('Failed to load photos');
    }
  }
  Future<PhotoModel> getPhotoById(int photoId) async {
    final response = await client.get(Uri.parse('$baseUrl/photos/$photoId'));
    if (response.statusCode == 200) {
      return PhotoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load photo');
    }
  }
}