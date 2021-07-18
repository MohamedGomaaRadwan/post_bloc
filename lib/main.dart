import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/Screens/album_screens/album_details_screen.dart';
import 'package:post_bloc/Screens/album_screens/album_screen.dart';
import 'package:post_bloc/Screens/todo_screen.dart';
import 'package:post_bloc/Screens/users_screen/user_details_screen.dart';
import 'package:post_bloc/Screens/users_screen/user_screen.dart';
import 'package:post_bloc/data/Repositories/post_repo.dart';
import 'Screens/post_screens/post_screen.dart';
import 'Screens/home_page_screen.dart';
import 'Screens/post_screens/post_details_screen.dart';
import 'bloc/post/post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          /// provide posts BLoc
          BlocProvider(
            create: (context) =>
                PostBloc(repository: PostRepositoryImplementation())
                  ..add(
                    FetchPosts(),
                  ),
          ),
        ],
        child: HomePage(),
      ),
      routes: {
        PostScreen.routeName: (context) => PostScreen(),
        PostDetailsScreen.routeName: (context) => PostDetailsScreen(),
        AlbumScreen.routeName: (context) => AlbumScreen(),
        AlbumDetailsScreen.routeName: (context) => AlbumDetailsScreen(),
        ToDoScreen.routeName: (context) => ToDoScreen(),
        UsersScreen.routeName: (context) => UsersScreen(),
        UserDetailsScreen.routeName: (context) => UserDetailsScreen(),
      },
    );
  }
}
