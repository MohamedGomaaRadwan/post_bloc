import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/Screens/post_screens/post_details_screen.dart';
import 'package:post_bloc/bloc/post/post_bloc.dart';
import 'package:post_bloc/data/Repositories/post_repo.dart';

class PostScreen extends StatelessWidget {
  static const routeName = '/post';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            PostBloc(repository: PostRepositoryImplementation())
              ..add(FetchPosts()),
        child: Scaffold(
          body: Center(
            child: BlocBuilder<PostBloc, PostState>(
              builder: (context, state) {
                if (state is PostLoading) {
                  return CircularProgressIndicator();
                }
                if (state is PostLoaded) {
                  return buildPostListView(state);
                } else if (state is PostError) {
                  return Center(child: CircularProgressIndicator());
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }

  ListView buildPostListView(PostLoaded state) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PostDetailsScreen.routeName,
                      arguments: state.posts[index]);
                },
                child: ListTile(
                  title: Text(
                    state.posts[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(state.posts[index].body),
                ),
              ),
            ),
          );
        });
  }
}
