part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoading extends AlbumState{}

class AlbumLoaded extends  AlbumState{
  late final List<Album> albums;
  AlbumLoaded({required this.albums});
}

class AlbumError extends AlbumState{
  late final String message;
  AlbumError({required this.message});
}