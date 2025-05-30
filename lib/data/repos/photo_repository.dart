import 'package:dio/dio.dart' show Dio;
import '../models/photo_model.dart';

class PhotoServices {
  final Dio dio;

  PhotoServices(this.dio);
  
  get _photoServices => PhotoServices(dio);

Future<List<PhotoModel>> fetchPhotos(int albumId) async {
  try {
    return await _photoServices.getPhotosByAlbumId(albumId);
  } catch (e) {
    throw Exception('Failed to load photos: $e');
  }
}
// Add your imports and class definition here


  Future<List<PhotoModel>> getPhotos() async {
    // Replace with actual API endpoint
    final response = await dio.get('https://jsonplaceholder.typicode.com/photos');
    return (response.data as List)
        .map((json) => PhotoModel.fromJson(json))
        .toList();
  }

  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/photos',
      queryParameters: {'albumId': albumId},
    );
    return (response.data as List)
        .map((json) => PhotoModel.fromJson(json))
        .toList();
  }

  // Existing methods...
}


abstract class IPhotoRepository {
  Future<List<PhotoModel>> getPhotos();
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId);
}


class PhotoRepository implements IPhotoRepository {
  final PhotoServices _photoServices;

  PhotoRepository({required Dio dio})
      : _photoServices = PhotoServices(dio);

  @override
  Future<List<PhotoModel>> getPhotos() async {
    try {
      return await _photoServices.getPhotos();
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    try {
      return await _photoServices.getPhotosByAlbumId(albumId);
    } catch (e) {
      throw Exception('Failed to load photos: $e');
    }
  }
}