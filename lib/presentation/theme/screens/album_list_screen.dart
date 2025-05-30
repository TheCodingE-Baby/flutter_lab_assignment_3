import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../logic/blocs/album_bloc.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          switch (state.status) {
            case AlbumStatus.initial:
              return Center(child: Text('Press the button to load albums'));
            case AlbumStatus.loading:
              return Center(child: CircularProgressIndicator());
            case AlbumStatus.loaded:
              return ListView.builder(
                itemCount: state.albums.length,
                itemBuilder: (context, index) {
                  final album = state.albums[index];
                  return ListTile(
                    title: Text(album.title),
                    subtitle: Text('Album ID: ${album.id}'),
                    onTap: () {
                      context.push('/album/${album.id}');
                    },
                  );
                },
              );
            case AlbumStatus.error:
              return Center(child: Text('Error: ${state.errorMessage}'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AlbumBloc>(context).add(LoadAlbums());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}