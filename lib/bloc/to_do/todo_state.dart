part of 'todo_bloc.dart';

@immutable
abstract class ToDoState {}

class ToDoInitial extends ToDoState {}

class TodoLoading extends ToDoState{}

class TodoLoaded extends ToDoState{
  late final List<ToDos> todoList;
  TodoLoaded({required this.todoList});}

class TodoError extends ToDoState{
  final String message;
  TodoError({required this.message});
}
