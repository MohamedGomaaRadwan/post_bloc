import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company extends Equatable {
  String? name;
  String? catchPhrase;
  String? bs;

  Company();

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  @override
  List<Object?> get props => [name, catchPhrase, bs];
}
