import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_bloc/Screens/post_screens/post_screen.dart';
import 'package:post_bloc/Screens/todo_screen.dart';
import 'package:post_bloc/Screens/users_screen/user_details_screen.dart';
import 'package:post_bloc/Screens/users_screen/user_screen.dart';

import 'album_screens/album_screen.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    PostScreen(),
    AlbumScreen(),
    ToDoScreen(),
    UsersScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Home Page'),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add),
              label: 'Posts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'Albums',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'ToDo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Users',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),      ),
    );
  }
}
