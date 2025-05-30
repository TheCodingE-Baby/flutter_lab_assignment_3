import 'package:bloc/bloc.dart';
import '../../data/repos/album_repository.dart';
import '../../data/services/api_services.dart';
import '../../data/models/album_model.dart';
import 'package:equatable/equatable.dart';


part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository;
  final ApiServices apiServices;
   AlbumBloc({required this.albumRepository, required this.apiServices}) : super(AlbumState()) {
    on<LoadAlbums>(_onLoadAlbums);
  }
  Future<void> _onLoadAlbums(LoadAlbums event, Emitter<AlbumState> emit) async {
    emit(state.copyWith(status: AlbumStatus.loading));
    try {
      final albums = await albumRepository.fetchAlbums();
      emit(state.copyWith(
        status: AlbumStatus.loaded,
        albums: albums,
        ));
      } catch(e){
        emit(state.copyWith(
          status: AlbumStatus.error,
          errorMessage: e.toString(),
        ));
    }
  }
}