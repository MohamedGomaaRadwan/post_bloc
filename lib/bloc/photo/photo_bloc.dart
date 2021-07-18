import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/photo.dart';
import 'package:post_bloc/data/Repositories/photo_repo.dart';
part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoRepository repository;
  PhotoBloc({required this.repository}) : super(PhotoInitial());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    if(event is FetchPhotos){
      yield PhotoLoading();
      try{
        final photos=await repository.getAllPhotos();
        yield PhotoLoaded(photos: photos);
      }catch(e){
        throw Exception(e.toString());
      }
    }

  }
}
