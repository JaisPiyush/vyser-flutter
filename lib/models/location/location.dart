import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  Location({
    required this.address,
    required this.city,
    required this.district,
    required this.state,
    required this.country,
    required this.area_code,
    required this.descriptor_name,
    required this.descriptor_code,
    required this.descriptor_short_desc,
    required this.descriptor_long_desc,
    this.id,
  });

  String? id;
  String address;
  String city;
  String district;
  String state;
  String country;
  String area_code;
  String descriptor_name;
  String descriptor_code;
  String descriptor_short_desc;
  String descriptor_long_desc;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
