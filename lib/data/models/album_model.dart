import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()

class AlbumModel {
  final int id;
  final int userId;
  final String title;
  final String coverUrl;

  AlbumModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.coverUrl,
  });
  
  factory AlbumModel.fromJson(Map<String, dynamic> json){
    return AlbumModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      coverUrl: json['coverUrl'],
    );
  }
}