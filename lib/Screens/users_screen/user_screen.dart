import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/Screens/users_screen/user_details_screen.dart';
import 'package:post_bloc/bloc/user_bloc/user_bloc.dart';
import 'package:post_bloc/data/Repositories/user_repo.dart';

class UsersScreen extends StatelessWidget {
  static const routeName = '/user_details';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
          UserBloc(repository: UserRepositoryImplementation())
            ..add(FetchUsers()),
          child: Scaffold(
            body: Center(
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return CircularProgressIndicator();
                  }
                  if (state is UserLoaded) {
                    return buildUsersListView(state);
                  } else if (state is UserError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  ListView buildUsersListView(UserLoaded state) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UserDetailsScreen.routeName,
                      arguments: state.users[index]);
                },
                child: Row(
                  children: [
                    Text('${state.users[index].id} - ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 15,
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          state.users[index].name??'',
                          style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          state.users[index].username??'',
                          style:
                          TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }


}
