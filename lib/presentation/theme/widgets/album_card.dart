import 'package:flutter/material.dart';
import '/data/models/album_model.dart';


class AlbumCard extends StatelessWidget {
  final AlbumModel album;

  const AlbumCard({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/albumDetails',
          arguments: album.id,
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.network(album.coverUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(album.title),
            ),
          ],
        ),
      ),
    );
  }
}
