import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:post_bloc/data/Models/user/company.dart';

import 'address.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props =>
      [id, name, username, email, address, phone, website, company];
}



