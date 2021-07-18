import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo.g.dart';
@JsonSerializable()
class Geo extends Equatable {
  String? lat;
  String? lng;

  Geo();

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);
  Map<String, dynamic> toJson() => _$GeoToJson(this);

  @override
  List<Object?> get props => [lat, lng];
}
