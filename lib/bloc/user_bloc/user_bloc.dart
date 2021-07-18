import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bloc/data/Models/user/user.dart';
import 'package:post_bloc/data/Repositories/user_repo.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;
  UserBloc({required this.repository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if(event is FetchUsers){
      yield UserLoading();
      try{
        final users = await repository.getAllUsers();
        yield UserLoaded(users: users);
      }catch(e){
        yield UserError(message: e.toString());
      }
    }
  }
}
