import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable(explicitToJson: true)
class Attributes {
  Attributes({this.attributes = const []});
  List<Map<String, dynamic>> attributes;

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}
