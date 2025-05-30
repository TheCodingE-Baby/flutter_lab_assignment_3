import 'package:flutter_lab_assignment_3/data/services/api_services.dart';
import '../models/album_model.dart';

abstract class IAlbumRepository {
  Future<List<AlbumModel>> fetchAlbums();
}

class AlbumRepository implements IAlbumRepository {
  final ApiServices apiServices;

  AlbumRepository({required this.apiServices});
  // Using Dio for network requests
  // final Dio dio; 
  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    try {
      return await apiServices.getAlbums();
    } catch (e) {
      throw Exception('Failed to load albums: $e');
    }
  }
}