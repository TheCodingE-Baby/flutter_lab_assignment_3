import 'package:bloc/bloc.dart' show Bloc;
import '../../logic/blocs/photo_event.dart';
import '../../../data/repos/photo_repository.dart';


class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc({required this.photoRepository}) : super(PhotoInitial());

  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if (event is LoadPhotos) {
      yield PhotoLoading();
      try {
        final photos = await photoRepository.getPhotosByAlbumId(event.albumId);
        yield PhotoLoaded(photos);
      } catch (e) {
        yield PhotoError(message: e.toString());
      }
    }
  }
}