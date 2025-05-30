import 'package:flutter/material.dart';
import '../../../data/models/photo_model.dart';

class PhotoGridItem extends StatelessWidget {
  final PhotoModel photo;

  const PhotoGridItem({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              photo.thumbnailUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              photo.title,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontFamily: 'Helvetica', fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
