part of 'photo_bloc.dart';

@immutable
abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState{}

class PhotoLoaded extends  PhotoState{
  late final List<Photo> photos;
  PhotoLoaded({required this.photos});
}

class PhotoError extends PhotoState{
  late final String message;
  PhotoError({required this.message});
}