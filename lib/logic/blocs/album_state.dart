part of 'album_bloc.dart';

enum AlbumStatus {
  initial,
  loading,
  loaded,
  error,
}
class AlbumState extends Equatable {
  final AlbumStatus status;
  final List<AlbumModel> albums;
  final String errorMessage;

  const AlbumState({
    this.status = AlbumStatus.initial,
    this.albums = const [],
    this.errorMessage = '',
  });

  @override
  List<Object?> get props => [status, albums, errorMessage];

  AlbumState copyWith({
    AlbumStatus? status,
    List<AlbumModel>? albums,
    String? errorMessage,
  }) {
    return AlbumState(
      status: status ?? this.status,
      albums: albums ?? this.albums,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}