import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_bloc/bloc/to_do/todo_bloc.dart';
import 'package:post_bloc/data/Repositories/todo_repo.dart';

class ToDoScreen extends StatefulWidget {
  static const routeName = '/todo';

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            ToDoBloc(repository: ToDoRepositoryImplementation())
              ..add(FetchToDo()),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: BlocBuilder<ToDoBloc, ToDoState>(
                    builder: (context, state) {
                      if (state is TodoLoading) {
                        return CircularProgressIndicator();
                      } else if (state is TodoLoaded) {
                        return ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.todoList.length,
                            itemBuilder: (context, index) {
                              return buildTodoRow(state, index);
                            });
                      } else if (state is TodoError) {
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

  Card buildTodoRow(TodoLoaded state, int index) {
    return Card(
      elevation: 6,
      child: Container(
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.todoList[index].title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Checkbox(
                  value: state.todoList[index].completed,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
