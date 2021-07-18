import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/todo.dart';
import 'package:post_bloc/data/Repositories/todo_repo.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final ToDoRepository repository;
  ToDoBloc({required this.repository}) : super(ToDoInitial());

  @override
  Stream<ToDoState> mapEventToState(ToDoEvent event) async* {
    if(event is ToDoEvent){
      yield TodoLoading();
      try{
        final todoList = await repository.getAllToDos();
        yield TodoLoaded(todoList: todoList);
      }catch(e){
        yield TodoError(message: e.toString());
      }
    }
  }
}
