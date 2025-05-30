import 'package:flutter/material.dart';
import '../../../data/models/album_model.dart';

class AlbumDetailScreen extends StatelessWidget {
  final AlbumModel album;

  const AlbumDetailScreen({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(album.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(album.coverUrl, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text('Album ID: ${album.id}'),
            Text('User ID: ${album.userId}'),
          ],
        ),
      ),
    );
  }
}