part of '../blocs/album_bloc.dart';

abstract class AlbumEvent extends Equatable {
  const AlbumEvent();

  @override
  List<Object?> get props => [];
}

class LoadAlbums extends AlbumEvent {}

class AddAlbum extends AlbumEvent {
  final AlbumModel album;

  const AddAlbum(this.album);

  @override
  List<Object?> get props => [album]; // Important: Add properties to props!
}

class DeleteAlbum extends AlbumEvent {
  final int albumId;

  const DeleteAlbum(this.albumId);

  @override
  List<Object?> get props => [albumId];
}