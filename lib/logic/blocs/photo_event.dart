import 'package:equatable/equatable.dart' show Equatable;
import '../../data/models/photo_model.dart';


abstract class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object?> get props => [];
}

class LoadPhotos extends PhotoEvent {
  final int albumId;

  const LoadPhotos(this.albumId);

  @override
  List<Object?> get props => [albumId];
}

abstract class PhotoState implements Equatable {
  const PhotoState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => false;

  @override
  bool operator ==(Object other) =>
      other is Equatable &&
          runtimeType == other.runtimeType &&
          props == other.props ||
      identical(this, other);

  @override
  int get hashCode => props.hashCode;
}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<PhotoModel> photos;

  const PhotoLoaded(this.photos);

  @override
  List<Object?> get props => [photos];
}

class PhotoError extends PhotoState {
  final String message;

  const PhotoError({required this.message});

  @override
  List<Object?> get props => [message];
}