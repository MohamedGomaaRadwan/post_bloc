import 'package:equatable/equatable.dart';

class ToDos extends Equatable{
  final int userId;
  final int id;
  final String title;
  final bool completed;
  ToDos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ToDos.fromJson(Map<String, dynamic> json) {
    return ToDos(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }

  @override
  List<Object?> get props => [userId,id,title,completed];

}
