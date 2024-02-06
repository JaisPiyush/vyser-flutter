import 'package:json_annotation/json_annotation.dart';

part 'unit.g.dart';

@JsonSerializable(explicitToJson: true)
class Unit {
  Unit({required this.key, required this.price, required this.measure});

  final String key;
  final double? price;
  final String measure;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
