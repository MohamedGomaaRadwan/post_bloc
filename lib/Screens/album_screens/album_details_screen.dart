import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/bloc/photo/photo_bloc.dart';
import 'package:post_bloc/data/Repositories/photo_repo.dart';

class AlbumDetailsScreen extends StatelessWidget {
  static const routeName = '/albums_details';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            PhotoBloc(repository: PhotoRepositoryImplementation())
              ..add(FetchPhotos()),
        child: Scaffold(
          body: Center(
            child: BlocBuilder<PhotoBloc, PhotoState>(
              builder: (context, state) {
                if (state is PhotoLoading) {
                  return CircularProgressIndicator();
                }
                if (state is PhotoLoaded) {
                  return buildAlbumsListView(state);
                } else if (state is PhotoError) {
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

  GridView buildAlbumsListView(PhotoLoaded state) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(state.photos.length, (index) {
        return Card(
          elevation: 6,
          child: Container(
            child: Image.network(state.photos[index].url),
          ),
        );
      }),
    );
  }
}
