import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/comment.dart';
import 'package:post_bloc/data/Repositories/comment_repo.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository repository;

  CommentBloc({required this.repository}) : super(CommentInitial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if(event is FetchComments){
      yield CommentLoading();
      try{
        final comments = await repository.getAllComments();
        yield CommentLoaded(comments: comments);
      }catch(message){
        throw Exception(message.toString());
      }
    }
  }
}
