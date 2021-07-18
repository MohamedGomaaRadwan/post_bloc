import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/bloc/comment/comment_bloc.dart';
import 'package:post_bloc/data/Models/post.dart';
import 'package:post_bloc/data/Repositories/comment_repo.dart';

class PostDetailsScreen extends StatelessWidget {
  static const routeName = '/post_details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Post;

    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            CommentBloc(repository: CommentRepositoryImplementation())
              ..add(FetchComments()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Text(
                          args.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          args.body,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text('All Comments'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: BlocBuilder<CommentBloc, CommentState>(
                    builder: (context, state) {
                      if (state is CommentLoading) {
                        return CircularProgressIndicator();
                      } else if (state is CommentLoaded) {
                        return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.comments.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 6,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  margin: EdgeInsets.all(15),
                                  child: ListTile(
                                    title: Text(
                                      state.comments[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    subtitle: Text(state.comments[index].body),
                                  ),
                                ),
                              );
                            });
                      } else if (state is CommentError) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildCommentsListView(CommentLoaded state) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.comments.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(15),
              child: ListTile(
                title: Text(
                  state.comments[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Text(state.comments[index].body),
              ),
            ),
          );
        });
  }
}
