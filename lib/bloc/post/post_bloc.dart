import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/post.dart';
import 'package:post_bloc/data/Repositories/post_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  final PostRepository repository;
  PostBloc({required this.repository}) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if(event is FetchPosts){
      yield PostLoading();
      try{
        final posts= await repository.getAllPosts();
        yield PostLoaded(posts: posts);
      }catch(message){
        yield PostError(message: message.toString());
      }
    }
  }
}
