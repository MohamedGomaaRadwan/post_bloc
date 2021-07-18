import 'package:json_annotation/json_annotation.dart';
import 'package:post_bloc/data/Models/user/geo.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
   String? street;
   String? suite;
   String? city;
   String? zipcode;
   Geo? geo;

  Address();

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

}


