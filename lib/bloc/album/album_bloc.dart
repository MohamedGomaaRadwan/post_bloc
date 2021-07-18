import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/album.dart';
import 'package:post_bloc/data/Repositories/album_repo.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository repository;
  AlbumBloc({required this.repository}) : super(AlbumInitial());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    if(event is FetchAlbums){
      yield AlbumLoading();
      try{
        final albums=await repository.getAllAlbums();
        yield AlbumLoaded(albums: albums);
      }catch(e){
        yield AlbumError(message: e.toString());
      }
    }
  }
}
