import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/bloc/album/album_bloc.dart';
import 'package:post_bloc/data/Repositories/album_repo.dart';
import 'album_details_screen.dart';

class AlbumScreen extends StatelessWidget {
  static const routeName = '/albums';
  @override
  Widget build(BuildContext context) {

    int x =5;
    int xy= x..toString();
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            AlbumBloc(repository: AlbumRepositoryImplementation())
              ..add(FetchAlbums()),
        child: Scaffold(
          body: Center(
            child: BlocBuilder<AlbumBloc, AlbumState>(
              builder: (context, state) {
                if (state is AlbumLoading) {
                  return CircularProgressIndicator();
                }
                if (state is AlbumLoaded) {
                  return buildAlbumsListView(state);
                } else if (state is AlbumError) {
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

  ListView buildAlbumsListView(AlbumLoaded state) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: state.albums.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              margin: EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AlbumDetailsScreen.routeName,
                      arguments: state.albums[index]);
                },
                child: Row(
                  children: [
                    Text('${index + 1}'),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      state.albums[index].title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
